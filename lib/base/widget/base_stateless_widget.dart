import 'package:flutter/material.dart';
import 'package:flutter_sample/base/base_imp.dart';
abstract class NioBaseStatelessWidget extends StatelessWidget {
  /*
  *页面开始方法
  *@params eventID 页面ID
  *@params data 数据map
  * */
  trackPageBegin({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageBegin(eventID: eventID, data: data);
  }

  /*
  *页面结束埋点方法
  *@params eventID 页面ID
  *@params data 数据map
  * */
  trackPageEnd({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageEnd(eventID: eventID, data: data);
  }
}