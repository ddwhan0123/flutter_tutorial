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
      children: <Widget>[
        renderTitle(ScreenUtil.getInstance()),
        renderContent(),
        renderFoot(),
        renderLine()
      ],
    );
  }

  Widget renderTitle(ScreenUtil screenInstance) {
    return Container(
        margin: EdgeInsets.only(
          left: 25,
          right: 25,
          top: 12,
        ),
        child: GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: screenInstance.setWidth(80),
                  width: screenInstance.setWidth(80),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              mallArticleBean.imUser.headImageUrl)))),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(mallArticleBean.imUser.nick,
                                      style: TextStyle(
                                        fontSize: screenInstance.setSp(28),
                                        color: styles
                                            .ComponentStyle.TITLE_TEXT_COLOR,
                                      )),
                                  _renderIconImg(screenInstance)
                                ],
                              ),
                              Text("",
                                  style: TextStyle(
                                    fontSize: screenInstance.setSp(24),
                                    color:
                                        styles.ComponentStyle.FOOT_TEXT_COLOR,
                                  )),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showToast('点击了关注');
                          },
                          child: Container(
                            height: screenInstance.setWidth(60),
                            width: screenInstance.setWidth(130),
                            child: Center(
                              child: Text(
                                '关注',
                                style: TextStyle(
                                    fontSize: screenInstance.setSp(24),
                                    color:
                                        styles.ComponentStyle.APP_MAIN_COLOR),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: styles.ComponentStyle.MALL_FOCUS_BG),
                          ) //右侧的签到按钮
                              ,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          onTap: () {
            showToast('跳转用户');
          },
        ));
  }

  /*
  渲染右侧Icon
  */
  Widget _renderIconImg(ScreenUtil screenInstance) {
    if (mallArticleBean.isNioAuthorized) {
      return Container(
        margin: EdgeInsets.fromLTRB(screenInstance.setWidth(14), 0, 0, 0),
        width: screenInstance.setWidth(50),
        height: screenInstance.setHeight(24),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/user_tips_img.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      );
    }
    return Container();
  }

  //中间图片这一行可以沿用首页
  Widget renderContent() {
    return Container(
      child: ItemCenterView(
          mallArticleBean.title, mallArticleBean.articleMiniPicUrl,
          onImageClick: (url) {
        showToast(url);
      }),
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
              style: TextStyle(
                  color: styles.ComponentStyle.FOOT_TEXT_COLOR,
                  fontSize: screenInstance.setSp(24))),
          Text(mallArticleBean.readCount.toString() + ' 人浏览',
              style: TextStyle(
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
