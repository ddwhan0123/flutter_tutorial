import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import 'package:flutter_sample/page/gift/article/mall_article_item.dart';
import 'package:flutter_sample/utils/screen_util.dart';

class MallArticleComponent extends BaseStatelessWidget {
  const MallArticleComponent(
      {Key key, this.mallArticleBeans, this.haveLine = false})
      : super(key: key);
  final List<MallArticleBean> mallArticleBeans;
  final bool haveLine;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: mallArticleBeans != null ? mallArticleBeans.length : 0,
      itemBuilder: (BuildContext context, int position) {
        return renderitem(context, position, screenInstance);
      },
    );
  }

  Widget renderitem(
      BuildContext context, int position, ScreenUtil screenInstance) {
    return MallArticleItemComponent(
        mallArticleBean: mallArticleBeans[position], haveLine: this.haveLine);
  }
}
