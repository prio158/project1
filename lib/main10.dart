import 'package:flutter/material.dart';

/*Padding的作用就是让里面的空间与四周产生边距*/
class MyPadding extends StatelessWidget {
  const MyPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text("Hello"),
    );
  }
}

class IConContainer extends StatelessWidget {
  final Color myColor;
  final IconData iconData;

  const IConContainer({Key? key, required this.myColor, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: myColor,
      height: 120,
      width: 120,
      child: Icon(
        iconData,
        color: Colors.yellow,
        size: 40,
      ),
    );
  }
}

/*水平布局:默认占满一行*/
class MyRow extends StatelessWidget {
  const MyRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            IConContainer(myColor: Colors.pink, iconData: Icons.safety_divider),
            IConContainer(
                myColor: Colors.teal, iconData: Icons.face_retouching_natural),
            IConContainer(
                myColor: Colors.purpleAccent,
                iconData: Icons.tab_unselected_outlined),
          ],
        ));
  }
}

/*垂直布局：默认占满一列*/
class MyColumn extends StatelessWidget {
  const MyColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            IConContainer(myColor: Colors.pink, iconData: Icons.safety_divider),
            IConContainer(
                myColor: Colors.teal, iconData: Icons.face_retouching_natural),
            IConContainer(
                myColor: Colors.purpleAccent,
                iconData: Icons.tab_unselected_outlined),
          ],
        ));
  }
}

/*弹性布局*/
class MyFlexExtend1 extends StatelessWidget {
  const MyFlexExtend1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        color: Colors.blue,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: const [
            /*这个IConContainer child设置宽度没有效果的*/
            Expanded(
              flex: 1,
              child: IConContainer(
                  myColor: Colors.pink, iconData: Icons.safety_divider),
            ),
            Expanded(
              flex: 2,
              child: IConContainer(
                  myColor: Colors.black, iconData: Icons.safety_divider),
            ),
          ],
        ));
  }
}

/*左边Expanded是自适应宽度的，右边IConContainer的宽度为设置的120*/
class MyFlexExtend2 extends StatelessWidget {
  const MyFlexExtend2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        color: Colors.blue,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: const [
            Expanded(
              flex: 1,
              child: IConContainer(
                  myColor: Colors.pink, iconData: Icons.safety_divider),
            ),
            IConContainer(myColor: Colors.black, iconData: Icons.safety_divider)
            // IConContainer(
            //     myColor: Colors.teal, iconData: Icons.face_retouching_natural),
            // IConContainer(
            //     myColor: Colors.purpleAccent,
            //     iconData: Icons.tab_unselected_outlined),
          ],
        ));
  }
}

/*弹性布局的例子*/
class MyFlexExtend3 extends StatelessWidget {
  const MyFlexExtend3({Key? key}) : super(key: key);
  static const String _src1 =
      "https://up.enterdesk.com/edpic/a5/7a/26/a57a2615a34218ac7ec0d3d7ceb64507.jpg";
  static const String _src2 =
      "https://up.enterdesk.com/edpic_source/25/fa/70/25fa70964a31e51dd2f2ca0be16db10b.jpg";
  static const String _src3 =
      "https://up.enterdesk.com/edpic/c7/13/aa/c713aaa432c4e86e79178bc8d72ba487.jpg";

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.vertical, children: [
      Container(
        width: double.infinity,
        height: 200,
        color: Colors.black,
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      ),
      Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              flex: 2,
              child: SizedBox(
                height: 150,
                child: Image.network(_src1),
              )),
          Expanded(
              flex: 1,
              child: SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.network(_src2),
                      ),
                      const SizedBox(height: 5,),
                      Expanded(
                        flex: 1,
                        child: Image.network(_src3),
                      ),
                    ],
                  )))
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
      body: const MyFlexExtend3(),
    ),
  ));
}
