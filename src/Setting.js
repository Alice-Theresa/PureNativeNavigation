import React from 'react'
import { View, Button } from 'react-native'

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
            title: 'Native'
          })
        }}
      />
      <Button
        title="push detail"
        onPress={() => {
          Navigatior.push('Detail')
        }}
      />
    </View>
  )
}

Setting.navigationItem = {
  hideNavigationBar: true
}

export default Setting
