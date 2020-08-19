import React from 'react'
import { View, Button } from 'react-native'

import { Navigatior } from '../index'

const Home = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center' }}>
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
        title="push native"
        onPress={() => {
          Navigatior.push('NativeViewController')
        }}
      />

      <Button
        title="present"
        onPress={() => {
          Navigatior.present('Present')
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
