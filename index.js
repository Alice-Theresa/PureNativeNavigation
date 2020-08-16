/**
 * @format
 */

import { AppRegistry, NativeModules } from 'react-native'
import App from './App'
import Tab from './src/Tab'
import Detail from './src/Detail'

AppRegistry.registerComponent('Tab1', () => App)
AppRegistry.registerComponent('Tab2', () => Tab)
AppRegistry.registerComponent('Tab3', () => Tab)
AppRegistry.registerComponent('Detail', () => Detail)

NativeModules.NavigationBridge.setRoot({
  root: {
    tabs: {
      children: [
        {
          name: 'Tab1'
        },
        {
          name: 'Tab2'
        },
        {
          name: 'Tab3',
          options: {
            hideNavigationBar: true
          }
        }
      ]
    }
  }
})
