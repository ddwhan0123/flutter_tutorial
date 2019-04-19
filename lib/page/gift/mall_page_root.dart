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
    return SafeArea(
        child: SizedBox.expand(
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: new Text("data"),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  String trackPageBeginMethod() {
    return null;
  }

  @override
  String trackPageEndMethod() {
    return null;
  }

  //异步操作模仿进页面跑网
  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      showToast('mall获取数据成功');
    });
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      showToast('获取数据成功');
    });
  }
}
