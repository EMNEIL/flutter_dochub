/*
 * @Description: 
 * @Author: chen hui
 * @Date: 2020-12-21 14:08:13
 */
import 'package:flutter/material.dart';
import 'package:flutter_dochub/pages/home/containers/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController tabController;
  static List tabData = [
    {'text': 'Home', 'icon': new Icon(Icons.home)},
    {'text': 'Home', 'icon': new Icon(Icons.home)},
    {'text': 'Home', 'icon': new Icon(Icons.home)},
  ];
  List<Widget> myTabs = [];
  @override
  @override
  void initState() {
    super.initState();
    tabController =
        new TabController(vsync: this, length: tabData.length, initialIndex: 0);
    for (var i = 0; i < tabData.length; i++) {
      myTabs.add(new Tab(
        text: tabData[i]['text'],
        icon: tabData[i]['icon'],
      ));
    }
  }

  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: TabBarView(
              children: [
                HomePage(),
                HomePage(),
                HomePage(),
              ],
              controller: tabController,
            ),
            bottomNavigationBar: Container(
              height: 40,
              color: Colors.blue,
            )));
  }
}

Widget createBottomNavigationBar(controller, tabs) {
  return Container(
    color: Colors.blue,
    child: SafeArea(
      child: Container(
        height: 65.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          color: Colors.red,
        ),
        child: new TabBar(
          controller: controller,
          indicatorWeight: 0.1,
          unselectedLabelColor: const Color(0xFF8E8E8E),
          tabs: tabs,
        ),
      ),
    ),
  );
}
