import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateful_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import 'package:flutter_sample/component/widget/page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MallBannerComponent extends BaseStatefullWidget {
  final List<MallBannerBean> bannerData;
  MallBannerComponent({Key key, this.bannerData}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MallBannerComponentState();
  }
}

class MallBannerComponentState extends BaseState<MallBannerComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(MallBannerComponent oldWidget) {
    print(oldWidget);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bannerData.length == 0) {
      return new Image.asset(
        'assets/images/banner_default_img.png',
        fit: BoxFit.fill,
      );
    }
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          widget.bannerData[index].img,
          fit: BoxFit.fill,
        );
      },
      onTap: ((int index) {
        showToast(widget.bannerData[index].goto.link);
      }),
      itemCount: widget.bannerData.length,
      pagination: new SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: new SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
            return new PageIndicator(
              layout: PageIndicatorLayout.NIO,
              size: 10.0,
              space: 15.0,
              count: widget.bannerData.length,
              controller: config.pageController,
            );
          })),
      autoplay: true,
    );
  }
}
