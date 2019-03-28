import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import '../component/home_main_item.dart';

class HomePage extends NioBaseStatefulPage {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends NioBasePageState<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text("ddwhan0123 sample"),
        elevation: 1.0,
      ),
      body: Center(
        child: new HomeMainItem()
      ),
    );
    return scaffold;
  }
  
 @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

   @override
  String trackPageBeginMethod() {
    return "页面开始方法";
  }

  @override
  String trackPageEndMethod() {
    return "页面结束方法";
  }
}


