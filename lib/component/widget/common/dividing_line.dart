import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../../style/style.dart' as styles;
/*
 * 
 * 公用的分割线
 */

class DividingLine extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: styles.ComponentStyle.DIVIVIDING_LINE_COLOR,
      width: ScreenUtil.screenWidth,
      height: 2.0,
    );
  }
}
