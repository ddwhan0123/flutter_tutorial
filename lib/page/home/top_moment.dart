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
  String version = '-1';

  @override
  void initState() {
    super.initState();
    getPlatformVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("MomentComponentState  " + version),
     
      ],
    );
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
