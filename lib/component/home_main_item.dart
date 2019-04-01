import 'package:flutter/material.dart';
import 'package:flutter_sample/page/home/top_experience.dart';
import 'package:flutter_sample/page/home/top_information.dart';
import 'package:flutter_sample/page/home/top_moment.dart';
import '../style/style.dart' as styles;
import './item_component_type_one/item_root_layout.dart';

class HomeMainItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeMainItemState();
}

class HomeMainItemState extends State<HomeMainItem> {
  //头部tab数据源
  final List<Container> _topTabs = <Container>[
    //主动给了个宽度，防止子控件内部挤压
    new Container(
      width: 55.0,
      child: new Tab(text: '推荐'),
    ),
    new Container(
      width: 55.0,
      child: new Tab(text: '此刻'),
    ),
    new Container(
      width: 55.0,
      child: new Tab(text: '体验'),
    ),
    new Container(
      width: 55.0,
      child: new Tab(text: '资讯'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: renderBar(),
        actions: <Widget>[renderRight()],
        leading: Builder(
          builder: (BuildContext context) {
            return renderLeft();
          },
        ),
      ),
      body: new TabBarView(
        //子项为滑动切换的各个容器
        children: <Widget>[
          new ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int position) {
                return buildItem(context, position);
              }),
          new MomentComponent(),
          new ExperienceComponent(),
          new InformationComponent(),
        ],
      ),
    );
    //tab的容器
    return DefaultTabController(
      length: _topTabs.length,
      child: scaffold,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  //ListView的Item
  Widget buildItem(BuildContext context, int index) {
    return new ItemRootLayout(index);
  }

  /*
   * 渲染自定义底部横线
   */
  UnderlineTabIndicator renderCustomIndicator() {
    //系统自带的方法里没有主动设置指示器宽度的放啊
    return UnderlineTabIndicator(
        borderSide: BorderSide(width: 2.5, color: Color(0xFF00BCBC)),
        insets: EdgeInsets.fromLTRB(12, 0, 12, 5));
  }

  /*
  * 渲染右上角的按钮
  * **/
  Padding renderRight() {
    //包一个Padding控制按钮位置
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        icon: Image.asset(
          'assets/images/home_add_icon.png',
          width: 20,
          height: 20,
        ),
        onPressed: () {},
      ),
    );
  }

  /*
  * 渲染左上角的按钮
  * **/
  Padding renderLeft() {
    //包一个Padding控制按钮位置
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        icon: Image.asset(
          'assets/images/home_search_icon.png',
          width: 20,
          height: 20,
        ),
        onPressed: () {},
      ),
    );
  }

  TabBar renderBar() {
    return TabBar(
      tabs: _topTabs,
      isScrollable: false, //不可滚动，该排为定死在最上面(如果item过多一定要支持滚动)
      labelColor: Colors.black,
      labelPadding: EdgeInsets.only(right: 5.0, left: 5.0),
      indicator: renderCustomIndicator(),
      labelStyle: new TextStyle(fontSize: 18.0, color: Colors.black),
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: styles.ComponentStyle.FOOT_TEXT_COLOR,
      unselectedLabelStyle: new TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}
