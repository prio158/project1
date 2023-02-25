import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // transform:  Matrix4.translationValues(-20, 0, 0), //位移
        // transform: Matrix4.rotationZ(0.2), //旋转
        // transform: Matrix4.skewX(-0.1), //倾斜
        alignment: Alignment.center,
        //配置Container内容器的位置
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.red,
            //背景颜色
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(color: Colors.cyan, blurRadius: 10.0)],
            gradient:
                const LinearGradient(colors: [Colors.red, Colors.yellow])),

        child: const Text(
          "WDNMD",
          style: TextStyle(fontSize: 20, color: Colors.black),
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center, //失效了是因为Container的alignment
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      decoration: const BoxDecoration(color: Colors.amberAccent),
      child: const Text(
        "MyTextMyTextMyTextMyTextMyText",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 0.1, //字母间距
            decoration: TextDecoration.underline,//底部加线
            decorationColor: Colors.red,
            decorationThickness: 2,
            decorationStyle: TextDecorationStyle.dashed,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        textAlign: TextAlign.right,
        //文字对齐方式
        maxLines: 1,
        overflow: TextOverflow.ellipsis, //溢出，就出省略号
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        "Button",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
            title:
                const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
        body: Column(
          children: const [MyApp(), MyButton(), MyText()],
        )),
  ));
}
