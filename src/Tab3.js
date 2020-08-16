import React from 'react'
import { View, NativeModules, Button } from 'react-native'

const Tab3 = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center' }}>
      <Button
        title="switch tab"
        onPress={() => {
          NativeModules.NavigationBridge.switchTab(1)
        }}
      />
    </View>
  )
}

export default Tab3
