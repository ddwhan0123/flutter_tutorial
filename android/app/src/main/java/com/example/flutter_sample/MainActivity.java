package com.example.flutter_sample;

import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;


import com.taobao.idlefish.flutterboost.containers.BoostFlutterActivity;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends BoostFlutterActivity {

    public static WeakReference<MainActivity> sRef;
    private View mLoadingContainer;

    @Override
    public void onRegisterPlugins(PluginRegistry registry) {
        GeneratedPluginRegistrant.registerWith(this);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        sRef = new WeakReference<>(this);
        super.onCreate(savedInstanceState);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if(null!=sRef){
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
        Map<String,String> params = new HashMap<>();
        params.put("key",getIntent().getStringExtra("key"));
        return params;
    }



}
