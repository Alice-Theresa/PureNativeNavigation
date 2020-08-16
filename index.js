/**
 * @format
 */

import { AppRegistry, NativeModules } from 'react-native'
import App from './App'
import Tab2 from './src/Tab2'
import Tab3 from './src/Tab3'
import Detail from './src/Detail'

AppRegistry.registerComponent('Tab1', () => App)
AppRegistry.registerComponent('Tab2', () => Tab2)
AppRegistry.registerComponent('Tab3', () => Tab3)
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
