import 'package:flutter/material.dart';

const double _kPanelHeaderCollapsedHeight = 48.0;
const double _kPanelHeaderExpandedHeight = 64.0;

class TripExpansionPanel extends StatefulWidget {
  final ExpansionPanel item;
  const TripExpansionPanel({
    required this.item, Key? key}) : super(key: key);

  @override
  State<TripExpansionPanel> createState() => _TripExpansionPanelState();
}

class _TripExpansionPanelState extends State<TripExpansionPanel> {

  final _kExpandedEdgeInsets = const EdgeInsets.symmetric(
      vertical: _kPanelHeaderExpandedHeight - _kPanelHeaderCollapsedHeight);
  final Duration _animationDuration = kThemeAnimationDuration;
  bool _isExpandedState = false;
  final border = BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10),);

  @override
  void initState() {
    super.initState();
    _isExpandedState = false;
  }

  @override
  Widget build(BuildContext context) {

    final Container header = Container(
      decoration: _isExpandedState ? null : border,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              duration: _animationDuration,
              curve: Curves.fastOutSlowIn,
              margin: EdgeInsets.zero,
              child: SizedBox(
                height: _kPanelHeaderCollapsedHeight,
                child: widget.item.headerBuilder(
                  context,
                  widget.item.isExpanded,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(end: 8.0),
            child: ExpandIcon(
              size: 30,
              isExpanded: _isExpandedState,
              padding: const EdgeInsets.all(16.0),
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

   final result =  Container(
     decoration:  _isExpandedState ? border : null,
     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[header,
         AnimatedCrossFade(
           firstChild:  Container(height: 0.0),
           secondChild: widget.item.body,
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



main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title: const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: TripExpansionPanel(item: ExpansionPanel(
              headerBuilder:(BuildContext context,bool isExpanded){
                /** 收缩时展示的Widget*/
                return Container(
                  margin: const EdgeInsets.only(top:10,bottom:10),
                  child: const Text(
                    "收缩时展示的文本",
                    maxLines: 1,
                    style: TextStyle(color: Colors.black,fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              /** 展开时的Widget*/
              body:Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text("Welcome to shanghai shanghaishanghaishanhai",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,) ,
              )


            ),
            ),
          )

    )
  ));
}
