import React from 'react'
import { View, Button } from 'react-native'

import { Navigatior } from '../index'

const NoNavigationBar = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Button
        title="push detail and hide bar"
        onPress={() => {
          Navigatior.push('NoNavigationBar')
        }}
      />
      <Button
        title="push detail"
        onPress={() => {
          Navigatior.push('Detail')
        }}
      />
      <Button
        title="pop"
        onPress={() => {
          Navigatior.pop()
        }}
      />
      <Button
        title="pop to root"
        onPress={() => {
          Navigatior.popToRoot()
        }}
      />
    </View>
  )
}

NoNavigationBar.navigationItem = {
  title: 'Detail',
  hideNavigationBar: true
}

export default NoNavigationBar
