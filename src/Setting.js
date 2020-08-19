import React from 'react'
import { View, NativeModules, Button } from 'react-native'

import { Navigatior } from '../index'

const Setting = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center' }}>
      <Button
        title="switch tab"
        onPress={() => {
          Navigatior.switchTab(0)
        }}
      />
      <Button
        title="push native"
        onPress={() => {
          Navigatior.push('NativeViewController', {
            options: {
              hideNavigationBar: true
            }
          })
        }}
      />
      <Button
        title="push detail"
        onPress={() => {
          Navigatior.push('Detail', {
            options: {
              hideNavigationBar: false
            }
          })
        }}
      />
    </View>
  )
}

Setting.navigationItem = {
  hideNavigationBar: true
}

export default Setting
