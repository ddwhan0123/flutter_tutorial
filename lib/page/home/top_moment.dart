import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MomentComponent extends BaseStatefulPage {
  //构造函数传参
  const MomentComponent({Key key, this.data}) : super(key: key);
  final String data;

  @override
  State<StatefulWidget> createState() {
    return new MomentComponentState();
  }
}

class MomentComponentState extends BasePageState {
  static const platform = const MethodChannel('samples.flutter.wjj');
  static const EventChannel eventChannel = EventChannel('event.flutter.wjj');

  String version = '-1';
  String _chargingStatus = 'Battery status: unknown.';

  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case "getFlutterName":
        return '随机的是 '+(Random().nextInt(30).toString());
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
    getPlatformVersion();
    platform.setMethodCallHandler(platformCallHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("MomentComponentState  " + version),
        Text(_chargingStatus),
      ],
    );
  }

  void _onEvent(Object event) {
    print('---> _onEvent event ' + event);
    setState(() {
      _chargingStatus =
          "Battery status: ${event == 'charging' ? '充电中' : '没有充电'}.";
    });
  }

  void _onError(Object error) {
    print('---> _onEvent error ' + error);
    setState(() {
      PlatformException exception = error;
      _chargingStatus = exception?.message ?? 'Battery status: unknown.';
    });
  }

  Future<Null> getPlatformVersion() async {
    String getPlatformVersion;
    try {
      final String result = await platform.invokeMethod('getPlatformVersion');
      getPlatformVersion = result;
    } on PlatformException catch (e) {
      getPlatformVersion = "Failed to get Build.VERSION level: '${e.message}'.";
    }
    setState(() {
      version = getPlatformVersion;
    });
  }

  @override
  String trackPageBeginMethod() {
    return null;
  }

  @override
  String trackPageEndMethod() {
    return null;
  }
}
