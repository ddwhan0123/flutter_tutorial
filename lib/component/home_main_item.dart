import 'package:flutter/material.dart';

import './item_component_type_one/item_root_layout.dart';

class HomeMainItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeMainItemState();
}

class HomeMainItemState extends State<HomeMainItem> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: new ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int position) {
             return buildItem(context, position);
            }),
      );

  @override
  void initState() {
    super.initState();
  }

  //ListView的Item
  Widget buildItem(BuildContext context, int index) {
    return new ItemRootLayout(index);
  }
}
