package com.purenativenavigation;

import android.util.Log;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

import java.util.Dictionary;

public class ALCNavigationBridge extends ReactContextBaseJavaModule {
    private static ReactApplicationContext reactContext;

    ALCNavigationBridge(ReactApplicationContext context) {
        super(context);
        reactContext = context;
    }

    @Override
    public String getName() {
        return "ALCNavigationBridge";
    }

    @ReactMethod
    public void registerReactComponent(String name, ReadableMap options) {
        Log.i("TAG", name);
    }

    @ReactMethod
    public void setRoot(ReadableMap options) {
        Log.i("TAG", "options");
    }
}
