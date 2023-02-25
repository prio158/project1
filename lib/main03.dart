import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center, //配置Container内容器的位置
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.red, //背景颜色
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(color: Colors.cyan, blurRadius: 10.0)],
            gradient:
                const LinearGradient(colors: [Colors.red, Colors.yellow])),

        child: const Text("WDNMD",
            style: TextStyle(fontSize: 20), textDirection: TextDirection.ltr),
      ),
    );
  }
}

main() {
  runApp(const MyApp());
}
