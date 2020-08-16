import React from 'react'
import { View, NativeModules, Button } from 'react-native'

const Detail = (props) => {
  console.log(props)
  return (
    <View style={{ flex: 1, ...props }}>
      <Button
        title="asd"
        onPress={() => {
          NativeModules.NavigationBridge.push('')
        }}
      />
    </View>
  )
}

export default Detail
