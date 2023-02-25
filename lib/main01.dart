import 'package:flutter/material.dart';

main() {
  runApp( MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
              const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: const Center(
          child: Text(
        "到此一游",
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.red, fontSize: 40),
      )),
    ),
  ));
}



