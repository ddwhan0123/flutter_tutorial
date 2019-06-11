package com.example.flutter_sample;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;


import com.taobao.idlefish.flutterboost.containers.BoostFlutterActivity;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends BoostFlutterActivity {
    //channel的名称，由于app中可能会有多个channel，这个名称需要在app内是唯一的。
    private String CHANNEL = "samples.flutter.wjj";
    public static WeakReference<MainActivity> sRef;
    private View mLoadingContainer;
    private MethodChannel methodChannel;

    @Override
    public void onRegisterPlugins(PluginRegistry registry) {
        GeneratedPluginRegistrant.registerWith(this);
    }

    private void LogFlutterStr() {
        methodChannel.invokeMethod("getFlutterName", null, new MethodChannel.Result() {
            @Override
            public void success(Object o) {
                // 这里就会输出 "Flutter name flutter"
                Log.d("---> success ", o.toString());
            }

            @Override
            public void error(String s, String s1, Object o) {
                Log.d("---> error ", s);
            }

            @Override
            public void notImplemented() {
            }
        });
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        sRef = new WeakReference<>(this);
        super.onCreate(savedInstanceState);
        methodChannel = new MethodChannel(getFlutterView(), CHANNEL);
        methodChannel.setMethodCallHandler((methodCall, result) -> {
            if (methodCall.method.equals("getPlatformVersion")) { // 对应dart端 invoceMethod
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                LogFlutterStr();
            } else {
                result.notImplemented();
            }
        });

        new EventChannel((getFlutterView()), "event.flutter.wjj").setStreamHandler(
                new EventChannel.StreamHandler() {
                    private BroadcastReceiver chargingStateChangeReceiver;

                    @Override
                    public void onListen(Object arguments, EventChannel.EventSink events) {
                        Log.d("--->onListen ", "");
                        chargingStateChangeReceiver = createChargingStateChangeReceiver(events);
                        registerReceiver(
                                chargingStateChangeReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
                    }

                    @Override
                    public void onCancel(Object arguments) {
                        Log.d(" ---> ", "arguments " + arguments.toString());
                        unregisterReceiver(chargingStateChangeReceiver);
                        chargingStateChangeReceiver = null;
                    }
                }
        );

    }

    private BroadcastReceiver createChargingStateChangeReceiver(final EventChannel.EventSink events) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                    events.error("UNAVAILABLE", "Charging status unavailable", null);
                } else {
                    boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                            status == BatteryManager.BATTERY_STATUS_FULL;
                    events.success(isCharging ? "charging" : "discharging");
                }
            }
        };
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (null != sRef) {
            sRef.clear();
            sRef = null;
        }
    }

    @Override
    protected View createSplashScreenView() {
        mLoadingContainer = LayoutInflater.from(getActivity()).inflate(R.layout.pure_credit_pay_activity_layout, null);
        FrameLayout frameLayout = new FrameLayout(this);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.gravity = Gravity.CENTER;
        frameLayout.addView(mLoadingContainer, params);
        return frameLayout;
    }

    @Override
    public String getContainerName() {
        return "homePage";
    }

    @Override
    public Map getContainerParams() {
        //params of the page
        Map<String, String> params = new HashMap<>();
        params.put("key", getIntent().getStringExtra("key"));
        return params;
    }
}
