import React from 'react'
import { View, Button, Text } from 'react-native'

import { Navigatior } from '../index'

const Present = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text style={{ fontSize: 20 }}>This is a presented view</Text>
      <Button
        title="dismiss"
        onPress={() => {
          Navigatior.dismiss()
        }}
      />
    </View>
  )
}

export default Present
