import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import 'package:flutter_sample/component/item_component_type_one/item_center.dart';
import 'package:flutter_sample/component/widget/common/dividing_line.dart';
import 'package:flutter_sample/utils/date_format.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../../style/style.dart' as styles;

class MallArticleItemComponent extends BaseStatelessWidget {
  const MallArticleItemComponent(
      {Key key, this.mallArticleBean, this.haveLine = false})
      : super(key: key);
  final MallArticleBean mallArticleBean;
  final bool haveLine;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[renderContent(), renderFoot(), renderLine()],
    );
  }

  Widget renderTitle() {}

  //中间图片这一行可以沿用首页
  Widget renderContent() {
    return Container(
      child: ItemCenterView(
          mallArticleBean.title, mallArticleBean.articleMiniPicUrl),
      margin: EdgeInsets.only(left: 25, right: 25),
    );
  }

  //底部评论这一行可以沿用首页
  Widget renderFoot() {
    var screenInstance = ScreenUtil.getInstance();
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              formatDate(
                  DateTime.fromMillisecondsSinceEpoch(
                      mallArticleBean.effectiveTime),
                  [mm, '-', dd]).toString(),
              style: new TextStyle(
                  color: styles.ComponentStyle.FOOT_TEXT_COLOR,
                  fontSize: screenInstance.setSp(24))),
          Text(mallArticleBean.readCount.toString() + ' 人浏览',
              style: new TextStyle(
                  color: styles.ComponentStyle.FOOT_TEXT_COLOR,
                  fontSize: screenInstance.setSp(24)))
        ],
      ),
    );
  }

  Widget renderLine() {
    if (null != this.haveLine && this.haveLine == true) {
      return DividingLine(isCenter: true);
    }
    return Container();
  }
}
