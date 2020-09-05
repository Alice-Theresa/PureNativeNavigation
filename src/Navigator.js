import { NativeModules } from 'react-native'

const NavigationBridge = NativeModules.ALCNavigationBridge

export class Navigator {
  constructor(screenID, moduleName) {
    this.screenID = screenID
    this.moduleName = moduleName
    this.resultListeners = []
  }

  waitResult() {
    return new Promise((resolve) => {
      const listener = (data) => {
        resolve(['ok', data])
        const index = this.resultListeners.indexOf(listener)
        if (index !== -1) {
          this.resultListeners.splice(index, 1)
        }
      }
      listener.cancel = () => {
        resolve(['cancel', null])
        const index = this.resultListeners.indexOf(listener)
        if (index !== -1) {
          this.resultListeners.splice(index, 1)
        }
      }
      this.resultListeners.push(listener)
      console.warn('push ' + this.resultListeners.length)
    })
  }

  result(data) {
    this.resultListeners.forEach((listener) => {
      listener(data)
    })
  }

  unmount = () => {
    console.warn('unmount ' + this.screenID + ' '+ this.resultListeners.length)
    this.resultListeners.forEach((listener) => {
      listener.cancel()
    })
  }

  setResult(data) {
    NavigationBridge.setResult(data)
  }

  push = async (component, options) => {
    console.warn('push ' + this.screenID);
    NavigationBridge.push(component, options)
    return await this.waitResult()
  }

  pop = () => {
    console.warn('pop ' + this.screenID);
    NavigationBridge.pop()
  }

  popToRoot = () => {
    NavigationBridge.popToRoot()
  }

  present = (component, options) => {
    NavigationBridge.present(component, options)
  }

  dismiss = () => {
    NavigationBridge.dismiss()
  }

  switchTab = (index) => {
    NavigationBridge.switchTab(index)
  }
}
