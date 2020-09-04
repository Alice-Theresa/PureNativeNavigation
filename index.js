/**
 * @format
 */
import React, { useEffect } from 'react'
import { AppRegistry, NativeModules, Image, NativeEventEmitter } from 'react-native'
import Home from './src/Home'
import Setting from './src/Setting'
import Detail from './src/Detail'
import Present from './src/Present'
import NoNavigationBar from './src/NoNavigationBar'

const NavigationBridge = NativeModules.ALCNavigationBridge

const registerComponent = (appKey, component) => {
  let options = component.navigationItem || {}
  NavigationBridge.registerReactComponent(appKey, options)
  let RootComponent = withNavigator()(component)
  AppRegistry.registerComponent(appKey, () => RootComponent)
}

registerComponent('Home', Home)
registerComponent('Setting', Setting)
registerComponent('Detail', Detail)
registerComponent('Present', Present)
registerComponent('NoNavigationBar', NoNavigationBar)

const EventEmitter = new NativeEventEmitter(NavigationBridge)

function withNavigator() {
  return function (WrappedComponent) {
    function FC(props, ref) {
      useEffect(() => {
        const subscription = EventEmitter.addListener('EVENT_NAVIGATION', (data) => {
          console.warn('******');
          if (data["KEY_ON"] === "ON_COMPONENT_RESULT") {
            Navigatior.resultListeners.forEach((listener) => {
              listener(data["KEY_REQUEST_CODE"], data["KEY_RESULT_CODE"], data["KEY_RESULT_DATA"])
            })
            console.warn(data);
          }
        })

        return () => {
          subscription.remove()
          Navigatior.resultListeners.forEach((listener) => {
            listener.cancel()
          })
        }
      }, [])

      return <WrappedComponent ref={ref} {...props} />
    }
    const FREC = React.forwardRef(FC)
    return FREC
  }
}

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

// export let resultListeners = []

export class Navigatior {
  static resultListeners = []

  static waitResult(requestCode) {
    return new Promise((resolve) => {
      const listener = (reqCode, resultCode, data) => {
        if (requestCode === reqCode) {
          resolve([resultCode, data])
          // const index = resultListeners.indexOf(listener)
          // if (index !== -1) {
          //   resultListeners.splice(index, 1)
          // }
        }
      }
      listener.cancel = () => {
        resolve(['RESULT_CANCEL', null])
      }
      Navigatior.resultListeners.push(listener)
    })
  }

  // static result(requestCode, resultCode, data) {
  //   Navigatior.resultListeners.forEach((listener) => {
  //     listener(requestCode, resultCode, data)
  //   })
  // }

  static setResult(resultCode, data) {
    NavigationBridge.setResult('sadsa64d6as', resultCode, data)
  }

  static push = async (component, options) => {
    NavigationBridge.push(component, options)
    return await Navigatior.waitResult(0)
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
