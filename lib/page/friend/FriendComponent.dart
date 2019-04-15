import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';

class FriendComponent extends BaseStatefulPage {
  //构造函数传参
  const FriendComponent({Key key, this.data}) : super(key: key);
  final String data;

  @override
  State<StatefulWidget> createState() {
    return new FriendComponentState();
  }
}

class FriendComponentState extends BasePageState {
  @override
  Widget build(BuildContext context) {
    return new Text("FriendComponentState");
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
