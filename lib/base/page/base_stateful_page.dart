import 'package:flutter/material.dart';
import 'package:flutter_sample/base/base_imp.dart';
import 'package:flutter_sample/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class NioBaseStatefulPage extends StatefulWidget {}

/*
 * 
 * State的抽象类父类，实现生命周期回调
 */
abstract class NioBasePageState<T extends NioBaseStatefulPage> extends State
    with WidgetsBindingObserver {
  //给子类实现的页面开始方法
  @protected
  String trackPageBeginMethod();
  //给子类实现的页面结束方法
  @protected
  String trackPageEndMethod();

  //子类可自行调用的埋点方法
  trackPageBegin({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageBegin(eventID: eventID, data: data);
  }

  trackPageEnd({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageEnd(eventID: eventID, data: data);
  }

  //实现Toast工具方法
  showToast(String msg,
      {Colors backgroundColor,
      double fontSize,
      Colors textColor,
      ToastGravity location,
      Toast toastLength}) {
    ToastUtils.show(msg,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        textColor: textColor,
        location: location,
        toastLength: toastLength);
  }

  //initState调用后触发，也可在initState方法里实现trackPageBegin
  @override
  void didChangeDependencies() {
    String eventId = trackPageBeginMethod();
    trackPageBegin(eventID: eventId);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  //控件彻底回收前触发，也可在deactive方法里实现trackPageEnd
  @override
  void dispose() {
    String eventId = trackPageEndMethod();
    trackPageEnd(eventID: eventId);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  //退出应用所出发的生命周期方法，demo阶段暂不实现具体逻辑
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
     
        break;
      case AppLifecycleState.resumed:
      
        break;
      case AppLifecycleState.suspending:
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
