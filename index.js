/**
 * @format
 */

import { AppRegistry, NativeModules, Image } from 'react-native'
import Home from './src/Home'
import Setting from './src/Setting'
import Detail from './src/Detail'
import Present from './src/Present'

AppRegistry.registerComponent('Home', () => Home)
AppRegistry.registerComponent('Setting', () => Setting)
AppRegistry.registerComponent('Detail', () => Detail)
AppRegistry.registerComponent('Present', () => Present)

NativeModules.ALCNavigationBridge.setRoot({
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
          icon: Image.resolveAssetSource(require('./src/image/Profile.png')),
          options: {
            hideNavigationBar: true
          }
        }
      ]
    }
  }
})
