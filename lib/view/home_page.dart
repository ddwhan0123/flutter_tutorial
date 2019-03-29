import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import 'package:flutter_sample/page/home/top_experience.dart';
import 'package:flutter_sample/page/home/top_information.dart';
import 'package:flutter_sample/page/home/top_moment.dart';
import '../component/home_main_item.dart';
import '../style/style.dart' as styles;

class HomePage extends NioBaseStatefulPage {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends NioBasePageState<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _topTabs = <Tab>[
    new Tab(
      text: '推荐',
    ),
    new Tab(
      text: '此刻',
    ),
    new Tab(
      text: '体验',
    ),
    new Tab(
      text: '资讯',
    ),
  ];

  //定义底部导航项目
  final List<Tab> _bottomTabs = <Tab>[
    new Tab(
      text: '发现',
      icon: new Icon(Icons.home),
    ), //icon和text的显示顺序已经内定，如需自定义，到child属性里面加吧
    new Tab(
      icon: new Icon(Icons.history),
      text: '朋友',
    ),
    new Tab(
      icon: new Icon(Icons.book),
      text: '爱车',
    ),
    new Tab(
      icon: new Icon(Icons.book),
      text: '惊喜',
    ),
    new Tab(
      icon: new Icon(Icons.book),
      text: '我的',
    ),
  ];

  //定义底部导航Tab
  TabController _bottomNavigation;

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: TabBar(
          tabs: _topTabs,
          isScrollable: true,
          labelColor: Colors.black,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: Color(0xFF00BCBC)),
              insets: EdgeInsets.symmetric(horizontal: 8.0)),
          labelStyle: new TextStyle(fontSize: 18.0, color: Colors.black),
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: styles.ComponentStyle.FOOT_TEXT_COLOR,
          unselectedLabelStyle: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      body: new TabBarView(
        children: <Widget>[
          new HomeMainItem(),
          new MomentComponent(),
          new ExperienceComponent(),
          new InformationComponent(),
        ],
      ),
      // bottomNavigationBar: new Material(
      //   color: Colors.white, //底部导航栏主题颜色
      //   child: new TabBar(
      //     controller: _bottomNavigation,
      //     tabs: _bottomTabs,
      //     labelColor: Colors.black,
      //   ),
      // ),
    );
    return DefaultTabController(
      length: _topTabs.length,
      child: scaffold,
    );
  }

  //初始化导航Tab控制器
  @override
  void initState() {
    super.initState();
    _bottomNavigation = new TabController(
        vsync: this, //动画处理参数
        length: _bottomTabs.length //控制Tab的数量
        );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    //释放资源
    _bottomNavigation.dispose();
    super.dispose();
  }

  @override
  String trackPageBeginMethod() {
    return "页面开始方法";
  }

  @override
  String trackPageEndMethod() {
    return "页面结束方法";
  }
}
