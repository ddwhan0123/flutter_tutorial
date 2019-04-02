import 'package:flutter/material.dart';
import 'package:flutter_sample/component/widget/pop/home_popover.dart';

class CupertinoPopoverMenuList extends StatelessWidget {
  final List<Widget> children;
  const CupertinoPopoverMenuList({this.children});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: children.length * 2 - 1,
      shrinkWrap: true,
      itemBuilder: (context, int i) {
        if (i.isOdd) {
          // 可添加分割线
          return const Divider(
            height: 0.0,
          );
        }
        final int index = i ~/ 2;
        return children[index];
      },
      padding: EdgeInsets.all(0.0),
    );
  }
}

//每一行item实现
class CupertinoPopoverMenuItem extends StatefulWidget {
  final Widget leading;
  final Widget child;
  final BoolCallback onTap;
  final bool isTapClosePopover;
  final Function onItemClick;
  final int itemID;

  const CupertinoPopoverMenuItem(
      {this.leading,
      this.child,
      this.onTap,
      this.isTapClosePopover = true,
      this.itemID,
      this.onItemClick});

  @override
  State<StatefulWidget> createState() =>
      CupertinoPopoverMenuItemState(onItemClick: onItemClick, itemID: itemID);
}

class CupertinoPopoverMenuItemState extends State<CupertinoPopoverMenuItem> {
  bool isDown = false;
  final int emptyItemID = -999;
  final Function onItemClick;
  final int itemID;

  CupertinoPopoverMenuItemState({this.onItemClick, this.itemID});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (widget.leading != null) {
      widgets.add(Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        height: 35.0,
        child: IconTheme(
            data:
                IconThemeData(color: Color(0xffFFFFFF), size: 20.0), //左侧icon样式
            child: widget.leading),
      ));
    }
    widgets.add(
      Container(child: widget.child),
    );
    return GestureDetector(
      onTapDown: (detail) {
        setState(() {
          isDown = true;
        });
      },
      onTapUp: (detail) {
        if (isDown) {
          setState(() {
            isDown = false;
          });
          if (widget.onTap != null) {
            return;
          }
          if (widget.isTapClosePopover) {
            Navigator.of(context).pop();
            if (null != this.onItemClick) {
              if (null != itemID) {
                onItemClick(this.itemID);
              } else {
                onItemClick(emptyItemID);
              }
            }
          }
        }
      },
      onTapCancel: () {
        if (isDown) {
          setState(() {
            isDown = false;
          });
        }
      },
      child: Container(
        color: isDown ? Color(0xFFd9d9d9) : Color(0xFF696D7F),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 15, top: 2, bottom: 2),
          child: Row(children: widgets),
        ),
      ),
    );
  }
}
