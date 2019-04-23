import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/component/item_component_type_two/item_view_pager.dart';

class MallLeftNavigationComponent extends BaseStatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new ItemViewPagerTypeTwo(new List());
  }

}