import React from 'react'
import { View, Button } from 'react-native'

import { Navigatior } from '../index'

const Detail = () => {
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
          Navigatior.setResult(7, { qwe: 123 })
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

Detail.navigationItem = {
  title: 'Detail',
  hideNavigationBar: false
}

export default Detail
