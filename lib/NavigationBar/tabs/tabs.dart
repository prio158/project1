import 'package:flutter/material.dart';
import 'package:project1/NavigationBar/tabs/trip.dart';
import 'home.dart';
import 'category.dart';
import 'settings.dart';


class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);


  @override
  State<Tabs> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<Tabs> {

  int _currentIndex = 0;
  final _pages = [
    const HomePage(),
    const CategoryPage(),
    const SettingsPage(),
    const TripPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
            const Text("Flutter Navigation", style: TextStyle(fontSize: 30))),
        body: _pages[_currentIndex],
        bottomNavigationBar:
            BottomNavigationBar(
              iconSize: 35,
              backgroundColor: Colors.grey,
              fixedColor: Colors.lightBlueAccent,
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,//底部超过4个tab，就需要配置
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.red,),
                  label: "首页",
                  backgroundColor: Colors.green,),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category, color: Colors.black),
                    label: "分类",
                    backgroundColor: Colors.grey),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings, color: Colors.black),
                    label: "系统设置",
                    backgroundColor: Colors.grey),
                BottomNavigationBarItem(
                    icon: Icon(Icons.trip_origin_sharp, color: Colors.black),
                    label: "行程",
                    backgroundColor: Colors.grey),

              ],
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },)
    );
  }
}

