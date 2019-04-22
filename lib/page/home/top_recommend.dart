import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';

class RecommendComponent extends BaseStatefulPage {
  //构造函数传参
  const RecommendComponent({Key key, this.data}) : super(key: key);
  final String data;

  @override
  State<StatefulWidget> createState() {
    return new RecommendComponentState();
  }
}

class RecommendComponentState extends BasePageState with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return new Text("RecommendComponentState");
  }

  @override
  String trackPageBeginMethod() {
    return null;
  }

  @override
  String trackPageEndMethod() {
    return null;
  }

  @override
  bool get wantKeepAlive => true;
}
