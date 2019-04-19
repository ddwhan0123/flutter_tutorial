import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/component/item_component_type_two/item_title.dart';
import 'package:flutter_sample/component/item_component_type_two/item_view_pager.dart';
import 'package:flutter_sample/component/widget/common/dividing_line.dart';

class ItemRootTypeTwo extends BaseStatelessWidget {
  final String title;
  final List imgList;
  ItemRootTypeTwo(this.title, this.imgList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0),
      child: new Column(
        children: <Widget>[
          new ItemTitleTypeTwo(this.title, () {
            showToast(this.title);
          }),
          ItemViewPagerTypeTwo(this.imgList),
          new DividingLine()
        ],
      ),
    );
  }
}
