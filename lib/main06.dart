import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const [
         SizedBox(height: 40),
         Icon(Icons.home,size: 40,color: Colors.red,),
         SizedBox(height: 40),
         Icon(Icons.safety_check,size: 40,color: Colors.red,),
         SizedBox(height: 40),
         Icon(MyICons.book,size: 40,color: Colors.red,),
         SizedBox(height: 40),
         Icon(MyICons.shop,size: 40,color: Colors.red,),
         SizedBox(height: 40),
         Icon(MyICons.code,size: 40,color: Colors.red,),
      ],
    );
  }
}

/*自定义ICON*/
class MyICons{
   static const IconData book = IconData(
     0xe7b3,
     fontFamily:"MyIcon",
     matchTextDirection: true
   );

   static const IconData shop = IconData(
       0xf0178,
       fontFamily:"MyIcon",
       matchTextDirection: true
   );

   static const IconData code = IconData(
       0xf01c6,
       fontFamily:"MyIcon",
       matchTextDirection: true
   );

}






main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
            title: const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
        body: Column(
          children: const [MyHomePage()],
        )),
  )) ;
}