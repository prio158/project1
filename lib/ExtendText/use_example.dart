import 'package:flutter/material.dart';



class TripExpansionPanel extends StatefulWidget {
  final ExpansionPanelItem item;
  const TripExpansionPanel({required this.item,Key? key}) : super(key: key);

  @override
  State<TripExpansionPanel> createState() => _TripExpansionPanelState();
}

class _TripExpansionPanelState extends State<TripExpansionPanel> {

  final List<ExpansionPanelItem> _expansionItems = [];
  @override
  void initState() {
    _expansionItems.add(widget.item);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionPanelList(
              elevation: 0,
              expansionCallback: (int panelIndex, bool isExpanded){
                setState((){
                  _expansionItems[panelIndex].isExpanded = !isExpanded;
                });
              },
              children: _expansionItems.map(
                  (ExpansionPanelItem item){
                    return ExpansionPanel(
                        backgroundColor:Colors.green,
                        headerBuilder:
                            (BuildContext context,bool isExpanded){
                              return Container(
                                color: Colors.grey,
                                child: Text(
                                  item.headerText, /**收缩时展示的文本*/
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                              );
                        },
                        body: item.body,
                        isExpanded: item.isExpanded
                    );
                  }
              ).toList(),
            )

          ],


        ),

      );
  }
}


class ExpansionPanelItem{
  /// 收缩时的标题*/
  final String headerText;
  /// 展开时的主体*/
  final Widget body;
  /// 默认的收缩状态*/
  bool isExpanded;

  ExpansionPanelItem({
    required this.headerText,
    required this.body,
    this.isExpanded = false
  });

}


class TestBox extends StatelessWidget {
  const TestBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 2),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text("第一行",style: TextStyle(fontSize: 20),),
          Text("第二行",style: TextStyle(fontSize: 20),),
          Text("第三行",style: TextStyle(fontSize: 20),),
          Text("第四行",style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}





main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
          const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: const TestBox()
    ),
  ));
}
