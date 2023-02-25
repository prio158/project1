import 'package:flutter/material.dart';

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


/*动态更新的ListView,根据服务器下发的数据，动态生成列表项*/
class DynamicListView extends StatelessWidget {
  const DynamicListView ({Key? key}) : super(key: key);
  static const _imageList = [_src1,_src2,_src3,_src4,_src5];
  List<Widget> _initList(){
    var list = <Widget>[];
    for(var i=0;i<20;i++){
      var imageIndex = i%_imageList.length;
      list.add(ListTile(leading:Image.network(_imageList[imageIndex]),
        title: Text("第${i+1}号女嘉宾"),subtitle: const Text("地点：上海"),));
    }
    return list;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(children:_initList(),);
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:_initList().length,
        itemBuilder: ((BuildContext context, int index){
          var imageIndex = index%_imageList.length;
          return ListTile(leading:Image.network(_imageList[imageIndex]),
            title: Text("第${index+1}号女嘉宾"),subtitle: const Text("地点：上海"));}
    ));
  }
}


main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
          const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: const DynamicListView(),
    ),
  ));
}
