import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text("普通按钮")),
          TextButton(onPressed: () {}, child: const Text("文本按钮")),
          OutlinedButton(onPressed: () {}, child: const Text("边框按钮")),
          const IconButton(onPressed: null, icon: Icon(Icons.thumb_up))
        ],
      ),
      const SizedBox(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up),
              label: const Text("点赞")),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.thumb_down),
              label: const Text("拉胯"))
        ],
      ),
      const SizedBox(
        height: 40,
      ),
      Row(
        /*button的背景、前景、文字颜色*/
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                  foregroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {},
              icon: const Icon(Icons.thumb_up),
              label: const Text("点赞")),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.thumb_down),
              label: const Text("拉胯"))
        ],
      ),
      const SizedBox(
        height: 40,
      ),
      /*button的大小*/
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 190,
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
                label: const Text("点赞")),
          )
        ],
      ),
      const SizedBox(
        height: 40,
      ),
      /*按钮自适应*/
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 120,
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up),
                      label: const Text("点赞"))))
        ],
      ),
      /*圆角按钮*/
      const SizedBox(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 120,
                  /*圆角*/
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up),
                      label: const Text("点赞"))))
        ],
      ),

      const SizedBox(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 80,
                  /*圆形按钮,修改边框颜色，粗细*/
                  child: ElevatedButton.icon(
                      style: const ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              CircleBorder(side: BorderSide(width: 3, color: Colors.red)))),
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up),
                      label: const Text("点赞"))))
        ],
      ),

      const SizedBox(
        height: 40,
      ),

      /*边框颜色、粗细 + 圆角*/
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
              style: ButtonStyle(side: const MaterialStatePropertyAll(
                 BorderSide(width: 2,color: Colors.black)
              ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                )
              ),
              onPressed: (){}, child: const Text("边框按钮"))
        ],
      )

    ]);
  }
}

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
              const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: const MyButton(),
    ),
  ));
}
