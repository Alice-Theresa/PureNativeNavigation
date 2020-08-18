import React from 'react'
import { View, NativeModules, Button, Text } from 'react-native'

const NavigationBridge = NativeModules.ALCNavigationBridge

const Present = (props) => {
  console.log(props)
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text style={{ fontSize: 20 }}>This is presented view</Text>
      <Button
        title="dismiss"
        onPress={() => {
          NavigationBridge.dismiss()
        }}
      />
    </View>
  )
}

export default Present
