import React from 'react'
import { View, NativeModules, Button } from 'react-native'

const NavigationBridge = NativeModules.ALCNavigationBridge

const Detail = (props) => {
  console.log(props)
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Button
        title="push detail and hide bar"
        onPress={() => {
          NavigationBridge.push('Detail', {
            options: {
              hideNavigationBar: true
            }
          })
        }}
      />
      <Button
        title="push detail"
        onPress={() => {
          NavigationBridge.push('Detail', {
            options: {
              hideNavigationBar: false
            }
          })
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

export default Detail
