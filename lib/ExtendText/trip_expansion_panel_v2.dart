import 'package:flutter/material.dart';


class TripExpansionPanel extends StatefulWidget {

  final ExpansionPanelItem expansionPanelItem;
  const TripExpansionPanel({
    required this.expansionPanelItem, Key? key}) : super(key: key);

  @override
  State<TripExpansionPanel> createState() => _TripExpansionPanelState();
}

class _TripExpansionPanelState extends State<TripExpansionPanel> {

  final Duration _animationDuration = kThemeAnimationDuration;
  bool _isExpandedState = false;
  //TODO:根据设计稿设置框的格式
  final _border = BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10),);
  late final ExpansionPanel _item;

  @override
  void initState() {
    super.initState();
    _isExpandedState = false;
    _item = ExpansionPanel(
        headerBuilder:
            (BuildContext context,bool isExpanded){
            return Text(
              widget.expansionPanelItem.headerText,
              //TODO:根据设计稿，设置字体格式
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,);
            },
        body: widget.expansionPanelItem.body,
        isExpanded: _isExpandedState
    );
  }

  @override
  Widget build(BuildContext context) {

    final Container header = Container(
      decoration: _isExpandedState ? null : _border,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              height: 50, //TODO：根据设计稿设置宽度
              duration: _animationDuration,
              curve: Curves.fastOutSlowIn,
              alignment: Alignment.center,
              child: _item.headerBuilder(
                  context,
                  _item.isExpanded,
                ),
              ),
            ),
          Container(
            //TODO：根据设计稿设置边距
            margin: const EdgeInsetsDirectional.only(end: 16.0),
            child: ExpandIcon(
              size: 30,
              isExpanded: _isExpandedState,
              onPressed: (bool isExpanded) {
                setState(() {
                  _isExpandedState = !_isExpandedState;
                });
              },
            ),
          ),
        ],
      ),
    );

    //TODO：根据设计稿设置Icon的大小和边距
    final expandedWidget = Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Column(
          children: [
            _item.body,
            Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 5),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.thumb_up)),
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.thumb_down)),
                  ],
                )
            )
          ],
        ),
    );


     final result =  Container(
       decoration:  _isExpandedState ? _border : null,
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           header,
           AnimatedCrossFade(
             firstChild:  Container(height: 0.0),
             secondChild: expandedWidget ,
             firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
             secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
             sizeCurve: Curves.fastOutSlowIn,
             crossFadeState: _isExpandedState ? CrossFadeState.showSecond : CrossFadeState.showFirst,
             duration: _animationDuration,),
       ],
       ),
     );

    return result;
  }
}


class ExpansionPanelItem{
  /// 收缩时的标题*/
  final String headerText;
  /// 展开时的主体*/
  final Widget body;

  ExpansionPanelItem({
    required this.headerText,
    required this.body,
  });

}


main(){
  runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: const Text("Flutter Project1",
                  style: TextStyle(fontSize: 30))),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: TripExpansionPanel(
              expansionPanelItem: ExpansionPanelItem(
                  headerText: "What`s you name?",
                  body: const Text(
                    "The spring outside, however, is much too cheap, for the sun shines on everything, and so does not seem as bright as that which shoots into the darkness of the house. Outside the sun-sloshed breeze blows everywhere, but it is not so lively as that which stirs the gloominess inside the house.",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  )),
            ),
          ))));
}

/*
* TODO:
*  1、服务端返回一段富文本
*  2、写一个富文本工具解析这个富文本，用一个Widget表示出来
*  3、将Widget设置为ExpansionPanelItem的body，再传给TripExpansionPanel
*
* */
