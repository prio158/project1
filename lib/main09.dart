import 'package:flutter/material.dart';




class MyGridView extends StatelessWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 4,//一行显示的数量
      children:const [Icon(Icons.abc_outlined),
        Icon(Icons.dangerous),
        Icon(Icons.safety_check),
        Icon(Icons.g_mobiledata),
        Icon(Icons.e_mobiledata),
        Icon(Icons.mail),
        Icon(Icons.baby_changing_station),
        Icon(Icons.safety_divider),
        Icon(Icons.dangerous),
        Icon(Icons.safety_check),
        Icon(Icons.g_mobiledata),
        Icon(Icons.e_mobiledata),
        Icon(Icons.mail),
        Icon(Icons.baby_changing_station),
        Icon(Icons.safety_divider),
      ],);
  }
}

class MyGridViewExtend extends StatelessWidget {
  const MyGridViewExtend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*maxCrossAxisExtent:横轴子元素的最大长度*/
    return GridView.extent(
      crossAxisSpacing: 20, //横轴间距
      mainAxisSpacing:10,   //Y轴间距
      padding: const EdgeInsets.all(10), //四周的间距
      childAspectRatio: 0.7, //每个grid的宽高比
      maxCrossAxisExtent: 40,children:const [
      Icon(Icons.dangerous),
      Icon(Icons.safety_check),
      Icon(Icons.g_mobiledata),
      Icon(Icons.e_mobiledata),
      Icon(Icons.mail),
      Icon(Icons.baby_changing_station),
      Icon(Icons.safety_divider),
      Icon(Icons.dangerous),
      Icon(Icons.safety_check),
      Icon(Icons.g_mobiledata),
      Icon(Icons.e_mobiledata),
      Icon(Icons.mail),
      Icon(Icons.baby_changing_station),
      Icon(Icons.safety_divider),
    ],);
  }
}

const String src1 =
    "https://up.enterdesk.com/edpic/a5/7a/26/a57a2615a34218ac7ec0d3d7ceb64507.jpg";
const String src2 =
    "https://up.enterdesk.com/edpic_source/25/fa/70/25fa70964a31e51dd2f2ca0be16db10b.jpg";
const String src3 =
    "https://up.enterdesk.com/edpic/c7/13/aa/c713aaa432c4e86e79178bc8d72ba487.jpg";
const String src4 =
    "https://up.enterdesk.com/edpic/b8/7a/af/b87aafd404fed36bc94b521a3575446b.jpg";
const String src5 =
    "https://img1.baidu.com/it/u=1725116171,3120005011&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500";


class DynamicGridView extends StatelessWidget {
  const DynamicGridView({Key? key}) : super(key: key);
  static const _imageList = [src1, src2, src3, src4, src5];

  List<Widget> _initList() {
    var list = <Widget>[];
    for (var i = 0; i < 20; i++) {
      var imageIndex = i % _imageList.length;

    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(crossAxisCount: 2,
      children: [],
    );
  }




}

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
          const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: const MyGridViewExtend(),
    ),
  ));
}
