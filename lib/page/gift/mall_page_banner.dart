import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateful_widget.dart';
import 'package:flutter_sample/component/widget/page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class MallBannerComponent extends BaseStatefullWidget {
  @override
  State<StatefulWidget> createState() {
    return new MallBannerComponentState();
  }
}

class MallBannerComponentState extends BaseState {
  var array = [
    'https://cdn-app-test.nio.com/MER/2019/1/22/30a27682-d4fe-4e3e-8b52-290ed85b759a.jpg',
    'https://cdn-app-test.nio.com/MER/2019/3/19/ab0f49c6-0182-4ad2-8054-4dfc235b4555_M.jpg',
    'https://cdn-app-test.nio.com/MER/2019/3/19/9ce3a4e3-1db2-4cda-a5ea-7e7b291a0f3c_M.jpg'
  ];
  PageController controller;

  @override
  void initState() {
    controller = new TransformerPageController(itemCount: 3, loop: true);
    super.initState();
  }

  @override
  void didUpdateWidget(MallBannerComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          array[index],
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      pagination: new SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: new SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
            return new PageIndicator(
              layout: PageIndicatorLayout.NIO,
              size: 10.0,
              space: 10.0,
              count: 3,
              controller: config.pageController,
            );
          })),
      autoplay: true,
    );
  }
}
