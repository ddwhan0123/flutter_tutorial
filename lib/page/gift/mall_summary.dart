import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import '../../style/style.dart' as styles;

class MallSummaryComponent extends BaseStatelessWidget {
  final MallSummaryBean mallSummaryBean;

  MallSummaryComponent(this.mallSummaryBean);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 25),
      child: Text(
        mallSummaryBean.text,
        style: TextStyle(
            color: styles.ComponentStyle.TITLE_TEXT_COLOR, fontSize: 20),
      ),
    );
  }
}
