import 'package:flutter/material.dart';

/*堆叠FrameLayout，从Z轴布局 */
class MyStack extends StatelessWidget {
  const MyStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 450,
          width: 400,
          color: Colors.blue,
        ),
        Container(
          height: 250,
          width: 200,
          color: Colors.red,
        ),
        /*确定位置的组件,移动child的位置*/
        const Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              "你好Flutter",
              style: TextStyle(fontSize: 30),
            )),
        const Positioned(
            left: 400 / 2,
            bottom: 450 / 2,
            child: Text(
              "你好Flutter",
              style: TextStyle(fontSize: 30),
            ))
      ],
    );
  }
}

/*在列表顶部添加浮动导航*/
class MyStackListView extends StatelessWidget {
  const MyStackListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*获取屏幕宽度*/
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ListView(
          padding: const EdgeInsets.only(top:50),
          children: const [
            ListTile(
              title: Text("我是一个列表123"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
            ListTile(
              title: Text("我是一个列表"),
            ),
          ],
        ),
          // Container(
          //   alignment: Alignment.center,
          //   width: size.width,
          //   height: 50,
          //   color: Colors.red,
          //   child: const Text(
          //     "二级导航",
          //     style: TextStyle(color: Colors.white, fontSize: 20),
          //   ),
          // )
        Container(
          width: size.width,
          height: 50,
          color: Colors.red,
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "二级导航",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}

/*
* Stack的层叠布局，类似FrameLayout、Align布局
* */
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
              const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: const MyStackListView(),
    ),
  ));
}
