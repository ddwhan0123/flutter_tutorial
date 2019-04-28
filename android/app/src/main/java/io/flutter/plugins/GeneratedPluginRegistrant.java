package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.thl.flustars.FlustarsPlugin;
import com.taobao.idlefish.flutterboost.FlutterBoostPlugin;
import io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import fleamarket.taobao.com.xservicekit.XserviceKitPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    FlustarsPlugin.registerWith(registry.registrarFor("com.thl.flustars.FlustarsPlugin"));
    FlutterBoostPlugin.registerWith(registry.registrarFor("com.taobao.idlefish.flutterboost.FlutterBoostPlugin"));
    FluttertoastPlugin.registerWith(registry.registrarFor("io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    XserviceKitPlugin.registerWith(registry.registrarFor("fleamarket.taobao.com.xservicekit.XserviceKitPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
