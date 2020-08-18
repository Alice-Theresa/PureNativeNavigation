import React from 'react';
import { View, NativeModules, Button } from 'react-native';

const NavigationBridge = NativeModules.ALCNavigationBridge;

const Tab2 = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center' }}>
      <Button
        title="push detail and hide bar"
        onPress={() => {
          NavigationBridge.push('Detail', {
            options: {
              hideNavigationBar: true,
            },
          });
        }}
      />
      <Button
        title="push detail"
        onPress={() => {
          NavigationBridge.push('Detail', {
            options: {
              hideNavigationBar: false,
            },
          });
        }}
      />
      <Button
        title="push native"
        onPress={() => {
          NavigationBridge.push('NativeViewController', {
            options: {
              // hideNavigationBar: true
            },
          });
        }}
      />

      <Button
        title="present"
        onPress={() => {
          NavigationBridge.present('Present', {});
        }}
      />
    </View>
  );
};

export default Tab2;
