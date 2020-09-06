import { NativeModules } from 'react-native'

const NavigationBridge = NativeModules.ALCNavigationBridge

export class Navigator {
  constructor(screenID, moduleName) {
    this.screenID = screenID
    this.moduleName = moduleName
    this.resultListeners = undefined
  }

  waitResult() {
    return new Promise((resolve) => {
      const listener = (data) => {
        resolve(['ok', data])
        this.resultListeners = undefined
      }
      listener.cancel = () => {
        resolve(['cancel', null])
        this.resultListeners = undefined
      }
      this.resultListeners = listener
    })
  }

  result(data) {
    this.resultListeners(data)
  }

  unmount = () => {
    this.resultListeners = undefined
  }

  setResult(data) {
    NavigationBridge.setResult(data)
  }

  push = async (component, options) => {
    console.warn('push ' + this.screenID)
    NavigationBridge.push(component, options)
    return await this.waitResult()
  }

  pop = () => {
    console.warn('pop ' + this.screenID)
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
