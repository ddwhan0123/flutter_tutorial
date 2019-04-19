import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import 'package:flutter_sample/base/widget/base_stateful_widget.dart';
import 'package:flutter_sample/component/item_one_root_layout.dart';
import 'package:flutter_sample/component/widget/pop/home_popover.dart';
import 'package:flutter_sample/component/widget/pop/home_popover_menu_item.dart';
import 'package:flutter_sample/page/home/top_experience.dart';
import 'package:flutter_sample/page/home/top_information.dart';
import 'package:flutter_sample/page/home/top_moment.dart';
import '../style/style.dart' as styles;

class HomeMainItem extends BaseStatefulPage {
  @override
  State<StatefulWidget> createState() => HomeMainItemState();
}

class HomeMainItemState extends BaseState<HomeMainItem> {
  List list = new List(); //列表要展示的数据

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
          new Container(
              child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: new ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int position) {
                  return buildItem(context, position);
                }),
          )),
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
    getData();
  }

  //异步操作模仿进页面跑网
  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      showToast('home获取数据成功');
    });
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      showToast('获取数据成功');
    });
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
  Container renderRight() {
    return Container(
      margin: EdgeInsets.only(right: 26.0, left: 0.0),
      child: _buildPopoverButton(),
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

  Widget _buildPopoverButton() {
    return CupertinoPopoverButton(
        popoverColor: Color(0xFF696D7F),
        child: Center(
          child: Image.asset(
            'assets/images/home_add_icon.png',
            width: 18,
            height: 18,
          ),
        ),
        popoverBuild: (context) {
          return CupertinoPopoverMenuList(
            children: <Widget>[
              CupertinoPopoverMenuItem(
                  itemID: 0,
                  leading: Image.asset(
                    'assets/images/icon_send_moment.png',
                    width: 18,
                    height: 18,
                  ),
                  child: Text(
                    "发此刻",
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16.0),
                  ),
                  onItemClick: (itemID) {
                    print('---> itemID ' + itemID.toString());
                  }),
              CupertinoPopoverMenuItem(
                  itemID: 1,
                  leading: Image.asset(
                    'assets/images/icon_new_group_chat.png',
                    width: 18,
                    height: 18,
                  ),
                  child: Text(
                    "建群聊",
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16.0),
                  ),
                  onItemClick: (itemID) {
                    print('---> itemID ' + itemID.toString());
                  }),
              CupertinoPopoverMenuItem(
                  itemID: 2,
                  leading: Image.asset(
                    'assets/images/icon_scan_code.png',
                    width: 18,
                    height: 18,
                  ),
                  child: Text(
                    "扫一扫",
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16.0),
                  ),
                  onItemClick: (itemID) {
                    print('---> itemID ' + itemID.toString());
                  }),
              CupertinoPopoverMenuItem(
                  leading: Image.asset(
                    'assets/images/icon_invite_drive.png',
                    width: 18,
                    height: 18,
                  ),
                  child: Text(
                    "邀请试驾",
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16.0),
                  ),
                  onItemClick: (itemID) {
                    print('---> itemID ' + itemID.toString());
                  })
            ],
          );
        });
  }
}
