import { NativeModules } from 'react-native'

const NavigationBridge = NativeModules.ALCNavigationBridge

export class Navigator {
  constructor(screenID, moduleName) {
    this.screenID = screenID
    this.moduleName = moduleName
    this.resultListener = undefined
  }

  waitResult() {
    return new Promise((resolve) => {
      const listener = (data) => {
        resolve(['ok', data])
        this.resultListener = undefined
      }
      listener.cancel = () => {
        resolve(['cancel', null])
        this.resultListener = undefined
      }
      this.resultListener = listener
    })
  }

  excute(data) {
    this.resultListener(data)
  }

  unmount = () => {
    this.resultListener.cancel()
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
