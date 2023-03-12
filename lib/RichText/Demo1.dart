import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';




/// RichText例子
/// RichText 是进阶版的 Text
///
/// */
Widget richTextWid01() {
  return RichText(
      text:const TextSpan(
          text: 'TextDirection.ltr 文字默认居左',
          style: TextStyle(fontSize: 16.0, color: Colors.black)),
      textDirection: TextDirection.ltr);
}

Widget richTextWid02() {
  return RichText(
      text:const TextSpan(
          text: 'TextDirection.rtl 文字默认居右',
          style: TextStyle(fontSize: 16.0, color: Colors.black)),
      textDirection: TextDirection.rtl);
}

Widget richTextWid03() {
  return RichText(
      text:const TextSpan(
          text: 'textDirection 与 textAlign 同时设置，优先看整体，文字居中',
          style: TextStyle(fontSize: 16.0, color: Colors.black)),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center);
}

/// RichText 可以借助 TextSpan 实现文字的多种效果*/


Widget richTextWid04() {
  return RichText(
      text: const TextSpan(
          text: '多种样式，如：',
          style: TextStyle(fontSize: 16.0, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: '红色',
                style: TextStyle(fontSize: 18.0, color: Colors.red,fontWeight: FontWeight.bold)),
            TextSpan(
                text: '绿色',
                style: TextStyle(fontSize: 18.0, color: Colors.green)),
            TextSpan(
                text: '蓝色',
                style: TextStyle(fontSize: 18.0, color: Colors.blue)),
            TextSpan(
                text: '白色',
                style: TextStyle(fontSize: 18.0, color: Colors.white)),
            TextSpan(
                text: '紫色',
                style: TextStyle(fontSize: 18.0, color: Colors.purple)),
            TextSpan(
                text: '黑色',
                style: TextStyle(fontSize: 18.0, color: Colors.black))
          ]),
      textAlign: TextAlign.center);
}


Widget richTextWid05() {
  var recognizer = TapGestureRecognizer();
  recognizer.onTap = (){
    print("点击");
  };
  return RichText(
      text: TextSpan(
          text: 'recognizer 为手势识别者，可设置点击事件，',
          style: TextStyle(fontSize: 17.0, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: '点我试试',
                style: TextStyle(fontSize: 17.0, color: Colors.blue),
                recognizer: recognizer)
          ]));
}




class TextSpanExample extends StatelessWidget {
  const TextSpanExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
          const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: richTextWid04(),
    ),
  ));
}




