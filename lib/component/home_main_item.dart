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
  final List<Container> _topTabs = <Container>[
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
        title: TabBar(
          tabs: _topTabs,
          isScrollable: false,
          labelColor: Colors.black,
          labelPadding: EdgeInsets.only(right: 5.0, left: 5.0),
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: Color(0xFF00BCBC)),
              insets: EdgeInsets.symmetric(horizontal: 7.5)),
          labelStyle: new TextStyle(fontSize: 18.0, color: Colors.black),
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: styles.ComponentStyle.FOOT_TEXT_COLOR,
          unselectedLabelStyle: new TextStyle(
            fontSize: 16.0,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: Image.asset('assets/images/home_add_icon.png',width: 20,height: 20,),
              onPressed: () {},
            ),
          )
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Image.asset('assets/images/home_search_icon.png',width: 20,height: 20,),
                onPressed: () {},
              ),
            );
          },
        ),
      ),
      body: new TabBarView(
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
}
