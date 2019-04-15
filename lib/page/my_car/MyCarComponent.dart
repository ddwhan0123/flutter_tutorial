import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';

class MyCarComponent extends BaseStatefulPage {
  //构造函数传参
  const MyCarComponent({Key key, this.data}) : super(key: key);
  final String data;

  @override
  State<StatefulWidget> createState() {
    return new MyCarComponentState();
  }
}

class MyCarComponentState extends BasePageState {
  @override
  Widget build(BuildContext context) {
    return new Text("MyCarComponentState");
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
