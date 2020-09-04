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
        onPress={async () => {
          const resp = await Navigatior.push('Detail')
          console.warn('----')
          console.warn(resp)
        }}
      />
      <Button
        title="push native"
        onPress={async () => {
          const resp = await Navigatior.push('NativeViewController', {
            title: 'Native'
          })
          console.warn('----')
          console.warn(resp)
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
