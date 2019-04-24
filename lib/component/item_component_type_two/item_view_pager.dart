import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

class ItemViewPagerTypeTwo extends BaseStatelessWidget {
  final List imgList;
  final bool needBottomText;
  final double imageWidth;
  ItemViewPagerTypeTwo(this.imgList,
      {this.needBottomText = true, this.imageWidth = 170.0});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var _screenInstance = ScreenUtil.getInstance();
    return Container(
      height: 230,
      child: new ListView.builder(
          physics: new ClampingScrollPhysics(), //禁用回弹
          controller: new ScrollController(keepScrollOffset: false),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (BuildContext context, int position) {
            return renderItem(position, context, _screenInstance);
          }),
    );
  }

  Widget renderItem(
      int position, BuildContext context, ScreenUtil _screenInstance) {
    var rootView = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new GestureDetector(
          onTap: () {
            showToast('点击图片item');
          },
          child: new Container(
            margin: EdgeInsets.only(right: 5),
            child: Image.network(imgList[position], width: this.imageWidth),
          ),
        ),
        renderBottomText(_screenInstance)
      ],
    );
    return rootView;
  }

  Widget renderBottomText(ScreenUtil _screenInstance) {
    if (!needBottomText) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: new Text(
        "ES8 购车指南",
        style: new TextStyle(
            color: styles.ComponentStyle.TITLE_TEXT_COLOR,
            fontSize: _screenInstance.setSp(30)),
      ),
    );
  }
}
