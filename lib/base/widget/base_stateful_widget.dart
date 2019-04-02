import 'package:flutter/material.dart';
import 'package:flutter_sample/base/base_imp.dart';
import 'package:flutter_sample/utils/toast_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';


abstract class BaseStatefullWidget extends StatefulWidget {
  
  trackPageBegin({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageBegin(eventID: eventID, data: data);
  }

  trackPageEnd({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageEnd(eventID: eventID, data: data);
  }
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

abstract class NioBaseState<T extends StatefulWidget> extends State {
  trackPageBegin({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageBegin(eventID: eventID, data: data);
  }

  trackPageEnd({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageEnd(eventID: eventID, data: data);
  }
}
