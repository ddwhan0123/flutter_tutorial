import 'package:flutter/material.dart';
import 'package:flutter_sample/component/home_main_item.dart';
import 'package:flutter_sample/page/friend/FriendComponent.dart';
import 'package:flutter_sample/page/gift/MallComponent.dart';
import 'package:flutter_sample/page/home/top_experience.dart';
import 'package:flutter_sample/page/home/top_information.dart';
import 'package:flutter_sample/page/me/MeComponent.dart';
import 'package:flutter_sample/page/my_car/MyCarComponent.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.black;
  int _currentIndex = 0;
  List<Widget> list = List();
  List<String> imges = List();
  List<String> imgesData = List();
  @override
  void initState() {
    initList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: list[_currentIndex],
        bottomNavigationBar: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    imges[0],
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '发现',
                    style:
                        TextStyle(color: _bottomNavigationColor, fontSize: 12),
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    imges[1],
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '朋友',
                    style:
                        TextStyle(color: _bottomNavigationColor, fontSize: 12),
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    imges[2],
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '爱车',
                    style:
                        TextStyle(color: _bottomNavigationColor, fontSize: 12),
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    imges[3],
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '惊喜',
                    style:
                        TextStyle(color: _bottomNavigationColor, fontSize: 12),
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    imges[4],
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '我的',
                    style:
                        TextStyle(color: _bottomNavigationColor, fontSize: 12),
                  )),
            ],
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
                imges = changeIconLogic(index);
              });
            },
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }

  //构建底部数据源
  initList() {
    list
      ..add(HomeMainItem())
      ..add(FriendComponent())
      ..add(MyCarComponent())
      ..add(MallComponent())
      ..add(MeComponent());

    imgesData
      ..add('assets/images/personal_home')
      ..add('assets/images/persional_friend')
      ..add('assets/images/personal_mycar')
      ..add('assets/images/personal_gift')
      ..add('assets/images/personal_my');
    for (int k = 0; k < imgesData.length; k++) {
      if (k == _currentIndex) {
        imges.add(imgesData[k] + '_on.png');
      } else {
        imges.add(imgesData[k] + '.png');
      }
    }
  }

  List<String> changeIconLogic(int index) {
    List<String> temp = imges;
    for (int k = 0; k < imgesData.length; k++) {
      if (k == index) {
        temp[k] = imgesData[k] + '_on.png';
      } else {
        temp[k] = imgesData[k] + '.png';
      }
      print(temp[k]);
    }
    return temp;
  }
}
