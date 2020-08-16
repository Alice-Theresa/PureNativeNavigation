import React from 'react'
import { View, NativeModules, Button } from 'react-native'

const Tab2 = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center' }}>
      <Button
        title="push detail"
        onPress={() => {
          NativeModules.NavigationBridge.push('Tab2', {
            backgroundColor: 'red'
          })
        }}
      />
      <Button
        title="push native"
        onPress={() => {
          NativeModules.NavigationBridge.push('NativeViewController', {
            backgroundColor: 'red'
          })
        }}
      />
      <Button
        title="pop"
        onPress={() => {
          NativeModules.NavigationBridge.pop()
        }}
      />
      <Button
        title="pop to root"
        onPress={() => {
          NativeModules.NavigationBridge.popToRoot()
        }}
      />
      <Button
        title="present"
        onPress={() => {
          NativeModules.NavigationBridge.present('Tab2', {})
        }}
      />
      <Button
        title="dismiss"
        onPress={() => {
          NativeModules.NavigationBridge.dismiss()
        }}
      />
      <Button
        title="logRoute"
        onPress={() => {
          NativeModules.NavigationBridge.logRoute()
        }}
      />
    </View>
  )
}

export default Tab2
