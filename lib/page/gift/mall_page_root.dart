import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import 'package:flutter_sample/bean/home/mall/mall_banner.dart';
import 'package:flutter_sample/page/gift/mall_page_banner.dart';
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
  var array = ['banner', 'bigItem', 'gridGoodsItem'];
  MallBanner mallBanner;
  List<Data> bannerDatas = [];
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
    mallBanner = new MallBanner(data: []);
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
        MallBanner banner = MallBanner.fromJson(datas);
        setState(() {
          mallBanner = banner;
          bannerDatas = banner.data;
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
          if (notification.metrics.pixels > 0) {
            if (notification.metrics.pixels < (ScreenUtil.screenWidthDp - 50)) {
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
              itemCount: 3,
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
                child: new Container(
                  child: new Image.asset(
                    'assets/images/icon_shoppingcar.png',
                    height: screenInstance.setWidth(44),
                    width: screenInstance.setWidth(44),
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
      child: getItemContent(array[position]),
      height: (ScreenUtil.screenWidthDp - 50),
    );
  }

  Widget getItemContent(String type) {
    switch (type) {
      case 'banner':
        return new MallBannerComponent(bannerData: this.bannerDatas);
      case 'bigItem':
        return new Text("data");
      case 'gridGoodsItem':
        return new Text("12121211");
    }
  }
}
