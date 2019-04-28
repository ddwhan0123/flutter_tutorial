//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <flustars/FlustarsPlugin.h>
#import <flutter_boost/FlutterBoostPlugin.h>
#import <fluttertoast/FluttertoastPlugin.h>
#import <shared_preferences/SharedPreferencesPlugin.h>
#import <xservice_kit/XserviceKitPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlustarsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlustarsPlugin"]];
  [FlutterBoostPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBoostPlugin"]];
  [FluttertoastPlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttertoastPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [XserviceKitPlugin registerWithRegistrar:[registry registrarForPlugin:@"XserviceKitPlugin"]];
}

@end
