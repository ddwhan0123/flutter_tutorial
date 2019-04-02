import 'package:flutter/material.dart';
import 'package:flutter_sample/base/base_imp.dart';
import 'package:flutter_sample/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
   const BaseStatelessWidget({ Key key }) : super(key: key);
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
}
