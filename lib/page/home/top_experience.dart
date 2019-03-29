import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';

class ExperienceComponent extends NioBaseStatefulPage {
  //构造函数传参
  const ExperienceComponent({Key key, this.data}) : super(key: key);
  final String data;

  @override
  State<StatefulWidget> createState() {
    return new ExperienceComponentState();
  }
}

class ExperienceComponentState extends NioBasePageState {
  @override
  Widget build(BuildContext context) {
    return new Text("ExperienceComponentState");
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
