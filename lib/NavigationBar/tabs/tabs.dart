import 'package:flutter/material.dart';
import 'package:project1/NavigationBar/tabs/message.dart';
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
  final Color _selectedColor = Colors.green;
  final _pages = [
    const HomePage(),
    const CategoryPage(),
    const MessagePage(),
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
              backgroundColor: Colors.white,
              fixedColor: Colors.green, //
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,//底部超过4个tab，就需要配置
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "首页",
                  ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: "分类",),
                BottomNavigationBarItem(icon: Icon(null),label: "发布"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "系统设置",),
                BottomNavigationBarItem(
                    icon: Icon(Icons.trip_origin_sharp),
                    label: "行程",),
              ],
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
            ),
          floatingActionButton: Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(top:15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40/2)
            ),
            child: FloatingActionButton(
              backgroundColor: _currentIndex==2 ? Colors.green:Colors.blue,
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

