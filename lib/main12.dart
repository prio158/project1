import 'package:flutter/material.dart';



class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*修改长宽比*/
    return AspectRatio(aspectRatio: 2/1,child: Container(color: Colors.red,),);
  }
}

/*Card组件*/
class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10)),
           margin: const EdgeInsets.all(10),
           color: Colors.green,
           elevation: 7, child: Column(
           children: const [
              ListTile(title: Text("张三", style: TextStyle(fontSize: 30),),
                subtitle: Text("开发工程师", style: TextStyle(fontSize: 20),),),
              Divider(),
              ListTile(title: Text("电话：12323543534"),),
              Divider(),
              ListTile(title: Text("地区：上海"),),
          ],
        )),
      ],
    );
  }
}

const String _src1 = "https://up.enterdesk.com/edpic/b8/7a/af/b87aafd404fed36bc94b521a3575446b.jpg";
const String _src2 = "https://up.enterdesk.com/edpic_source/25/fa/70/25fa70964a31e51dd2f2ca0be16db10b.jpg";
class MyCardListView extends StatelessWidget {
  const MyCardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
          Card(
            margin: const EdgeInsets.all(10),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            child: Column(
              children: [
                AspectRatio(aspectRatio: 16/9,
                child: Image.network(_src1,fit: BoxFit.cover,height: 40,width: 40,),),
                const ListTile(
                  leading: CircleAvatar(radius:25, backgroundImage:NetworkImage(_src1),),
                  title:  Text("UserName",style: TextStyle(fontSize: 20),),
                  subtitle:  Text("SubName",style: TextStyle(fontSize: 15),),
                )
              ],
            ),
          ),
          Card(
          margin: const EdgeInsets.all(10),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10,
          child: Column(
            children: [
              AspectRatio(aspectRatio: 16/9,
                child: Image.network(_src2,fit: BoxFit.cover,height: 40,width: 40,),),
              const ListTile(
                leading: CircleAvatar(radius:25, backgroundImage:NetworkImage(_src2),),
                title:  Text("UserName",style: TextStyle(fontSize: 20),),
                subtitle:  Text("SubName",style: TextStyle(fontSize: 15),),
              )
            ],
          ),
        )
      ],
    );
  }
}





main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
          const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: const MyCardListView(),
    ),
  ));
}
