package com.example.flutter_sample.route;

import android.content.Context;
import android.content.Intent;

import com.example.flutter_sample.MainActivity;
import com.example.flutter_sample.android.NativeActivity;

public class PageRouter {

    static final String NATIVE_PAGE_URL = "nio://nativePage";
    static final String FLUTTER_HOME_PAGE_URL = "nio://homePage";

    public static boolean openPageByUrl(Context context, String url) {
        return openPageByUrl(context, url, 0);
    }

    public static boolean openPageByUrl(Context context, String url, int requestCode) {
        try {
            if (url.startsWith(FLUTTER_HOME_PAGE_URL)) {
                context.startActivity(new Intent(context, MainActivity.class));
                return true;
            } else if (url.startsWith(NATIVE_PAGE_URL)) {
                context.startActivity(new Intent(context, NativeActivity.class));
                return true;
            } else {
                return false;
            }
        } catch (Throwable t) {
            return false;
        }
    }
}
