/**
 * @format
 */

import { AppRegistry, NativeModules, Image } from 'react-native'
import Home from './src/Home'
import Setting from './src/Setting'
import Detail from './src/Detail'
import Present from './src/Present'
import NoNavigationBar from './src/NoNavigationBar'

const NavigationBridge = NativeModules.ALCNavigationBridge

const registerComponent = (appKey, component) => {
  let options = component.navigationItem || {}
  NavigationBridge.registerReactComponent(appKey, options)
  AppRegistry.registerComponent(appKey, () => component)
}

registerComponent('Home', Home)
registerComponent('Setting', Setting)
registerComponent('Detail', Detail)
registerComponent('Present', Present)
registerComponent('NoNavigationBar', NoNavigationBar)

NavigationBridge.setRoot({
  root: {
    tabs: {
      children: [
        {
          component: 'Home',
          title: '主页',
          icon: Image.resolveAssetSource(require('./src/image/Home.png'))
        },
        {
          component: 'Setting',
          title: '设置',
          icon: Image.resolveAssetSource(require('./src/image/Profile.png'))
        }
      ]
    }
  }
})

export class Navigatior {
  static push = (component, options) => {
    NavigationBridge.push(component, options)
  }

  static pop = () => {
    NavigationBridge.pop()
  }

  static popToRoot = () => {
    NavigationBridge.popToRoot()
  }

  static present = (component, options) => {
    NavigationBridge.present(component, options)
  }

  static dismiss = () => {
    NavigationBridge.dismiss()
  }

  static switchTab = (index) => {
    NavigationBridge.switchTab(index)
  }
}
