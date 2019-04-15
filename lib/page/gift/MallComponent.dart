import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';

class MallComponent extends BaseStatefulPage {
  //构造函数传参
  const MallComponent({Key key, this.data}) : super(key: key);
  final String data;

  @override
  State<StatefulWidget> createState() {
    return new MallComponentState();
  }
}

class MallComponentState extends BasePageState {
  @override
  Widget build(BuildContext context) {
    return new Text("MallComponentComponentState");
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
