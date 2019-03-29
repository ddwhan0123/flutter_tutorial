import 'package:flutter/material.dart';
import 'package:flutter_sample/component/home_main_item.dart';
import 'package:flutter_sample/page/home/top_experience.dart';
import 'package:flutter_sample/page/home/top_information.dart';
import 'package:flutter_sample/page/home/top_moment.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.black;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(HomeMainItem())
      ..add(MomentComponent())
      ..add(ExperienceComponent())
      ..add(InformationComponent())
      ..add(InformationComponent());
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
                    'assets/images/personal_home_on.png',
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '发现',
                    style: TextStyle(color: _bottomNavigationColor,fontSize: 12),
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/persional_friend.png',
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '朋友',
                    style: TextStyle(color: _bottomNavigationColor,fontSize: 12),
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/personal_mycar.png',
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '爱车',
                    style: TextStyle(color: _bottomNavigationColor,fontSize: 12),
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/personal_gift.png',
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '惊喜',
                    style: TextStyle(color: _bottomNavigationColor,fontSize: 12),
                  )),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/personal_my.png',
                    width: 20,
                    height: 20,
                  ),
                  title: Text(
                    '我的',
                    style: TextStyle(color: _bottomNavigationColor,fontSize: 12),
                  )),
            ],
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }
}
