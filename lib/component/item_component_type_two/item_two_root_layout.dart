import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/component/item_component_type_two/item_title.dart';

class ItemRootTypeTwo extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new ItemTitleTypeTwo('ES8/ES6最新政策&邀请试驾', () {
          showToast('ES8/ES6最新政策&邀请试驾');
        })
      ],
    );
  }
}
