import 'package:flutter/material.dart';


main() {
  runApp( MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
              const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: const MyApp(),
    ),
  ));
}


/*flutter自定义组件：其实就是一个类，需要继承StatefulWidget/StatelessWidget */
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "到此一游",
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.red, fontSize: 40),
    ));
  }
}

class MyAppLess extends StatelessWidget {
  const MyAppLess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "到此一游",
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.red, fontSize: 40),
    ));
  }
}
