import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import 'package:flutter_sample/component/item_component_type_one/item_center.dart';

class MallArticleTitleComponent extends BaseStatelessWidget {
  const MallArticleTitleComponent({Key key, this.mallArticleBean})
      : super(key: key);
  final MallArticleBean mallArticleBean;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        renderContent(),
      ],
    );
  }

  Widget renderTitle() {}

  //中间图片这一行可以沿用首页
  Widget renderContent() {
    return new Container(
      child: ItemCenterView(
          mallArticleBean.title, mallArticleBean.articleMiniPicUrl),
      margin: EdgeInsets.only(left: 25, right: 25),
    );
  }

  //底部评论这一行可以沿用首页
  Widget renderFoot() {}
}
