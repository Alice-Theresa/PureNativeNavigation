import React from 'react'
import { View, NativeModules, Button } from 'react-native'

const NavigationBridge = NativeModules.ALCNavigationBridge

const Detail = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Button
        title="push detail and hide bar"
        onPress={() => {
          NavigationBridge.push('NoNavigationBar', {})
        }}
      />
      <Button
        title="push detail"
        onPress={() => {
          NavigationBridge.push('Detail', {})
        }}
      />
      <Button
        title="pop"
        onPress={() => {
          NavigationBridge.pop()
        }}
      />
      <Button
        title="pop to root"
        onPress={() => {
          NavigationBridge.popToRoot()
        }}
      />
    </View>
  )
}

Detail.navigationItem = {
  title: 'Detail',
  hideNavigationBar: false
}

export default Detail
