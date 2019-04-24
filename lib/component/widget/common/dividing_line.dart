import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../../style/style.dart' as styles;
/*
 * 
 * 公用的分割线
 */

class DividingLine extends BaseStatelessWidget {
  final bool isCenter;

  DividingLine({this.isCenter = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: styles.ComponentStyle.DIVIVIDING_LINE_COLOR,
      width: ScreenUtil.screenWidth,
      height: 1.5,
      margin: EdgeInsets.only(
          bottom: 10 + (isCenter ? 20.0 : 0.0),
          left: isCenter ? 25 : 0,
          right: isCenter ? 25 : 0),
    );
  }
}
