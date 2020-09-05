import { NativeModules } from 'react-native'

const NavigationBridge = NativeModules.ALCNavigationBridge


export class Navigator {

  constructor(screenID, moduleName) {
    this.screenID = screenID
    this.moduleName = moduleName
    this.resultListeners = []
  }

  waitResult(requestCode) {
    return new Promise((resolve) => {
      const listener = (reqCode, resultCode, data) => {
        if (requestCode === reqCode) {
          resolve([resultCode, data])
          const index = this.resultListeners.indexOf(listener)
          if (index !== -1) {
            this.resultListeners.splice(index, 1)
          }
        }
      }
      listener.cancel = () => {
        resolve(['RESULT_CANCEL', null])
      }
      this.resultListeners.push(listener)
      console.warn(this.screenID + ' push ' + this.resultListeners.length);
    })
  }

  result(requestCode, resultCode, data) {
    console.warn(this.screenID + ' ' + this.resultListeners.length);
    this.resultListeners.forEach((listener) => {
      listener(requestCode, resultCode, data)
    })
  }

  unmount = () => {
    this.resultListeners.forEach((listener) => {
      listener.cancel()
    })
  }

  setResult(resultCode, data) {
    NavigationBridge.setResult(this.screenID, resultCode, data)
  }

  push = async (component, options) => {
    NavigationBridge.push(component, options)
    return await this.waitResult(0)
  }

  pop = () => {
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
