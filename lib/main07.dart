import 'package:flutter/material.dart';
import 'package:project1/main06.dart';

const String _src =
    "https://img2.baidu.com/it/u=2596823598,3774591149&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=450";

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListView(children: <Widget>[
      ListTile(
        leading: Icon(
          Icons.home,
          color: Colors.blue,
        ),
        title: Text("首页"),
        trailing: Icon(Icons.arrow_right),
      ),
      Divider(),
      ListTile(
        leading: Icon(
          Icons.label,
          color: Colors.yellow,
        ),
        title: Text("订单"),
      ),
      Divider(),
      ListTile(
        leading: Icon(
          Icons.collections,
          color: Colors.green,
        ),
        title: Text("收藏"),
      ),
      Divider(),
      ListTile(
        leading: Icon(
          Icons.my_library_add,
          color: Colors.black,
        ),
        title: Text("我的"),
      ),
      Divider(),
      ListTile(
        title: Text("我是一个列表"),
      ),
      Divider(),
      ListTile(
        title: Text("我是一个列表"),
      ),
      Divider(),
      ListTile(
        title: Text("我是一个列表"),
      ),
      Divider(),
      ListTile(
        title: Text("我是一个列表"),
      ),
      Divider(),
      ListTile(
        title: Text("我是一个列表1"),
      ),
      Divider(),
      ListTile(
        title: Text("我是一个列表2"),
      ),
      Divider(),
      ListTile(
        title: Text("我是一个列表3"),
      ),
      Divider(),
      ListTile(
        title: Text("我是一个列表4"),
      ),
    ]);
  }
}

const String _src1 =
    "https://up.enterdesk.com/edpic/a5/7a/26/a57a2615a34218ac7ec0d3d7ceb64507.jpg";
const String _src2 =
    "https://up.enterdesk.com/edpic_source/25/fa/70/25fa70964a31e51dd2f2ca0be16db10b.jpg";
const String _src3 =
    "https://up.enterdesk.com/edpic/c7/13/aa/c713aaa432c4e86e79178bc8d72ba487.jpg";
const String _src4 =
    "https://up.enterdesk.com/edpic/b8/7a/af/b87aafd404fed36bc94b521a3575446b.jpg";
const String _src5 =
    "https://img1.baidu.com/it/u=1725116171,3120005011&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500";

class MyImageList extends StatelessWidget {
  const MyImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.network(_src1),
        const SizedBox(
          height: 24,
          child: Text("1号女嘉宾", textAlign: TextAlign.center),
        ),
        Image.network(_src2),
        const SizedBox(
          height: 24,
          child: Text("2号女嘉宾", textAlign: TextAlign.center),
        ),
        Image.network(_src3),
        const SizedBox(
          height: 24,
          child: Text("3号女嘉宾", textAlign: TextAlign.center),
        ),
        Image.network(_src4),
        const SizedBox(
          height: 24,
          child: Text("4号女嘉宾", textAlign: TextAlign.center),
        ),
        Image.network(_src5),
        const SizedBox(
          height: 24,
          child: Text("5号女嘉宾", textAlign: TextAlign.center),
        )
      ],
    );
  }
}

/*水平列表*/
class MyHorList extends StatelessWidget {
  const MyHorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140, //在水平滑动中，高度是自适应屏幕的，为了设置高度，所以在外面套了一个SizeBox
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(
            width: 110,
            //decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                 SizedBox(
                  height:100,
                  child: Image.network(_src1,fit:BoxFit.cover),
                ),
                const Text("1号女嘉宾", textAlign: TextAlign.center)],
            ),
          ),
          SizedBox(
            width: 110,
            //decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                SizedBox(
                  height:100,
                  child: Image.network(_src1,fit:BoxFit.cover),
                ),
                const Text("1号女嘉宾", textAlign: TextAlign.center)],
            ),
          ),
          SizedBox(
            width: 110,
            //decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                SizedBox(
                  height:100,
                  child: Image.network(_src1,fit:BoxFit.cover),
                ),
                const Text("1号女嘉宾", textAlign: TextAlign.center)],
            ),
          ),
          SizedBox(
            width: 110,
            //decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                SizedBox(
                  height:100,
                  child: Image.network(_src1,fit:BoxFit.cover),
                ),
                const Text("1号女嘉宾", textAlign: TextAlign.center)],
            ),
          ),
          SizedBox(
            width: 110,
            //decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                SizedBox(
                  height:100,
                  child: Image.network(_src1,fit:BoxFit.cover),
                ),
                const Text("1号女嘉宾", textAlign: TextAlign.center)],
            ),
          ),
          SizedBox(
            width: 110,
            //decoration: const BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                SizedBox(
                  height:100,
                  child: Image.network(_src1,fit:BoxFit.cover),
                ),
                const Text("1号女嘉宾", textAlign: TextAlign.center)],
            ),
          ),
        ],
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
      body: const MyHorList(),
    ),
  ));
}
