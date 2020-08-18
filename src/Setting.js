import React from 'react';
import { View, NativeModules, Button } from 'react-native';

const NavigationBridge = NativeModules.ALCNavigationBridge;

const Tab3 = () => {
  return (
    <View style={{ flex: 1, justifyContent: 'center' }}>
      <Button
        title="switch tab"
        onPress={() => {
          NavigationBridge.switchTab(0);
        }}
      />
      <Button
        title="push native"
        onPress={() => {
          NavigationBridge.push('NativeViewController', {
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
    </View>
  );
};

export default Tab3;
