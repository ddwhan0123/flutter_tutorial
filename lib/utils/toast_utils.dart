import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
* Toast工具类
* msg为 show的内容必传
* */
class ToastUtils {
  static show(String msg,
      {Colors backgroundColor,
      double fontSize,
      Colors textColor,
      ToastGravity location,
      Toast toastLength}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength != null ? toastLength : Toast.LENGTH_SHORT,
        gravity: location != null ? location : ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor:
            backgroundColor != null ? backgroundColor : Colors.black,
        textColor: textColor != null ? textColor : Colors.white,
        fontSize: fontSize != null ? fontSize : 16.0);
  }
}
