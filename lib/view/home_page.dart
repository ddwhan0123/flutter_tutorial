import 'package:flutter/material.dart';
import '../component/home_main_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
     print('--->HomeState build');
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text("ddwhan0123 sample"),
        elevation: 1.0,
      ),
      body: Center(
        child: new HomeMainItem()
      ),
    );
    return scaffold;
  }
  
 @override
  void initState() {
    print('--->initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('--->didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    print('--->didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('---> deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('---> dispose');
    super.dispose();
  }
}


