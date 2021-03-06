import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import 'package:flutter_sample/page/gift/article/mall_article_root.dart';
import 'package:flutter_sample/page/gift/mall_all_goods.dart';
import 'package:flutter_sample/page/gift/mall_big_item.dart';
import 'package:flutter_sample/page/gift/mall_goods_root.dart';
import 'package:flutter_sample/page/gift/mall_left_navigation.dart';
import 'package:flutter_sample/page/gift/mall_no_more.dart';
import 'package:flutter_sample/page/gift/mall_page_banner.dart';
import 'package:flutter_sample/page/gift/mall_summary.dart';
import 'package:flutter_sample/utils/screen_util.dart';

class MallComponent extends BaseStatefulPage {
  //构造函数传参
  const MallComponent({Key key, this.data}) : super(key: key);
  final String data;

  @override
  State<StatefulWidget> createState() {
    return new MallComponentState();
  }
}

class MallComponentState extends BasePageState {
  var barOpacity = 0.0; //默认不透明
  List<ResultData> resultDataList; //大页面主数据
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox.expand(
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: renderAppBar(),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  String trackPageBeginMethod() {
    return null;
  }

  @override
  String trackPageEndMethod() {
    return null;
  }

  //异步操作模仿进页面跑网
  Future getData() async {
    await Future.delayed(Duration(seconds: 1), () {
      Future<String> loadString = DefaultAssetBundle.of(context)
          .loadString("assets/data/mock/mock_mall.json");
      loadString.then((String value) {
        var datas = json.decode(value);
        resultDataList = MallMainBean.fromJson(datas).resultData;
        setState(() {
          resultDataList = resultDataList;
        });
      });

      showToast('mall获取数据成功');
    });
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      showToast('获取数据成功');
    });
  }

  //半透明appbar
  Widget renderAppBar() {
    var barHeight = AppBar().preferredSize.height;
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.pixels > 0 &&
              notification.metrics.pixels <= (ScreenUtil.screenWidthDp - 50)) {
            if (notification.metrics.pixels < (ScreenUtil.screenWidthDp - 50)) {
              print((notification.metrics.pixels /
                      (ScreenUtil.screenWidthDp - 50))
                  .toString());
              setState(() {
                barOpacity = notification.metrics.pixels /
                    (ScreenUtil.screenWidthDp - 50);
              });
            }
          }
        },
        child: new Stack(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: resultDataList != null ? resultDataList.length : 0,
              itemBuilder: (BuildContext context, int position) {
                return renderitem(context, position, screenInstance);
              },
            ),
            new Opacity(
              child: new Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil.screenWidth,
                color: Colors.white,
                height: barHeight,
              ),
              opacity: barOpacity,
            ),
            new Positioned(
                child: new GestureDetector(
                  onTap: () {
                    showToast('点击了购物车');
                  },
                  child: new Container(
                    child: new Image.asset(
                      'assets/images/icon_shoppingcar.png',
                      height: screenInstance.setWidth(44),
                      width: screenInstance.setWidth(44),
                    ),
                  ),
                ),
                right: 25,
                top: (barHeight / 4)),
          ],
        ));
  }

  Widget renderitem(
      BuildContext context, int position, ScreenUtil screenInstance) {
    return new Container(
      color: Colors.white,
      child: getItemContent(
          resultDataList != null ? resultDataList[position].type : '',
          position),
    );
  }

  Widget getItemContent(String type, int position) {
    var haveLine = resultDataList[position].haveLine;
    var data = resultDataList[position].data;
    switch (type) {
      case 'banner':
        return MallBannerComponent(
          bannerData: data,
          haveLine: haveLine,
        );
      case 'leftNavigation':
        return MallLeftNavigationComponent(
          bannerData: data,
          haveLine: haveLine,
        );
      case 'article':
        return MallArticleComponent(mallArticleBeans: data, haveLine: haveLine);
      case 'summary':
        return MallSummaryComponent(data);
      case 'gridGoodsItem':
        return MallGridGoodsComponent(data);
      case 'bigItem':
        return MallBigItemComponent(
          data,
          haveLine: haveLine,
        );
      case 'allGoods':
        return MallAllGoodsComponent(
          data,
          haveLine: haveLine,
        );
      case 'lastText':
        return MallLastTextComponent(
          data,
        );
    }
  }
}
