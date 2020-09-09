import React, { useEffect } from 'react'
import { AppRegistry, NativeModules, Image, NativeEventEmitter } from 'react-native'
import Home from './src/Home'
import Setting from './src/Setting'
import Detail from './src/Detail'
import Present from './src/Present'
import NoNavigationBar from './src/NoNavigationBar'
import { Navigator } from './src/Navigator'

const NavigationBridge = NativeModules.ALCNavigationBridge

const EventEmitter = new NativeEventEmitter(NavigationBridge)

const withNavigator = (moduleName) => {
  return (WrappedComponent) => {
    const FC = (props, ref) => {
      const { screenID } = props
      const navigator = new Navigator(screenID, moduleName)
      useEffect(() => {
        const subscription = EventEmitter.addListener('NavigationEvent', (data) => {
          if (data['screen_id'] === screenID && data['event'] === 'component_result') {
            if (data['result_type'] === 'cancel') {
              navigator.unmount()
            } else {
              navigator.excute(data['result_data'])
            }
          }
        })
        return () => {
          subscription.remove()
        }
      }, [])
      const injected = {
        navigator
      }
      return <WrappedComponent ref={ref} {...props} {...injected} />
    }
    const FREC = React.forwardRef(FC)
    return FREC
  }
}

const registerComponent = (appKey, component) => {
  let options = component.navigationItem || {}
  NavigationBridge.registerReactComponent(appKey, options)
  let withComponent = withNavigator(appKey)(component)
  AppRegistry.registerComponent(appKey, () => withComponent)
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
