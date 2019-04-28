package com.example.flutter_sample;

import android.os.Bundle;

import com.taobao.idlefish.flutterboost.containers.BoostFlutterActivity;

import java.lang.ref.WeakReference;
import java.util.Map;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends BoostFlutterActivity {

    public static WeakReference<MainActivity> sRef;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        sRef = new WeakReference<>(this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        sRef.clear();
        sRef = null;
    }

    @Override
    public String getContainerName() {
        return "homePage";
    }

    @Override
    public Map getContainerParams() {
        return null;
    }

    @Override
    public void onRegisterPlugins(PluginRegistry registry) {
        GeneratedPluginRegistrant.registerWith(this);
    }

}
