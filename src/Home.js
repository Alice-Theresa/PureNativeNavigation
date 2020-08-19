import React from 'react'
import { View, NativeModules, Button } from 'react-native'

const NavigationBridge = NativeModules.ALCNavigationBridge

const Home = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center' }}>
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
        title="push native"
        onPress={() => {
          NavigationBridge.push('NativeViewController', {})
        }}
      />

      <Button
        title="present"
        onPress={() => {
          NavigationBridge.present('Present', {})
        }}
      />
    </View>
  )
}

Home.navigationItem = {
  title: 'Home',
  hideNavigationBar: false
}

export default Home
