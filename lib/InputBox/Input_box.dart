import 'package:flutter/material.dart';


FocusNode _focusNode = FocusNode();
typedef CheckCallBack = bool Function(String text);

abstract class Validator{
  bool checkText(String text);
}

class EmailValidator implements Validator{

  static const String _TESTER = "^[-!#\$%&'*+\\/0-9=?A-Z^_a-z`{|}~](\\.?[-!#\$%&'*+\\/0-9=?A-Z^_a-z`{|}~])*@[a-zA-Z0-9](-*\\.?[a-zA-Z0-9])*\\.[a-zA-Z](-?[a-zA-Z0-9])+\$";
  
  @override
  bool checkText(String email) {
    if(email.isEmpty) return false;

    var emailParts =  email.split("@");
    if(emailParts.length!=2) return false;
    String account = emailParts[0];
    String address = emailParts[1];

    if(account.isEmpty || address.isEmpty) return false;
    if(account.length > 64 || address.length >255) return false;

    var domainParts = address.split("\\.");
    for (var element in domainParts) {
      if(element.isNotEmpty && element.length >63){
        return false;
      }
    }
    RegExp reg = RegExp(_TESTER);
    return reg.hasMatch(email);
  }
}



class InputBox extends StatefulWidget {
  String? _hintText;
  String? _labelText;
  String? _errorText;
  Validator? _validator;

  InputBox({String? hintText,String? labelText,String? errorText,Validator? validator,Key? key}) : super(key: key){
    _hintText = hintText;
    _labelText = labelText;
    _errorText = errorText;
    _validator = validator;
  }

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  String? _hintText;
  String? _labelText;
  String? _errorText;
  Validator? _validator;
  String? _errorTextDisplay;
  Color? _borderColor;

  @override
  void initState() {
    _hintText =  widget._hintText;
    _errorText = widget._errorText;
    _validator = widget._validator;
    _errorTextDisplay = null ;
    _labelText = widget._labelText;

    _focusNode.addListener(() {
      /** 输入框被选中*/
      if (_focusNode.hasFocus) {
        setState(() {
          _borderColor = Colors.blue;
          _errorTextDisplay = null;
        });
      } else {
        setState(() {
          _borderColor = Colors.grey;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    /** 错误: 红色*/
    if(_errorTextDisplay!=null){
      _borderColor = Colors.red;
    }

    return TextField(
            autofocus: true,
            focusNode: _focusNode,
            style: const TextStyle(color: Colors.black,fontSize: 20) ,
            decoration:  InputDecoration(
              /** 未聚焦时的边框设置*/
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color:_borderColor ?? Colors.grey,width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              /** 聚焦后的边框设置*/
              focusedBorder:OutlineInputBorder(
                borderSide:  BorderSide(color:_borderColor ?? Colors.blue,width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: _labelText,
              labelStyle: TextStyle(color:_borderColor,fontSize: 16),
              border: InputBorder.none,
              hintText: _hintText,
              hintStyle:const TextStyle(color:Colors.grey,fontSize: 20),
              helperText: _errorTextDisplay,
              helperStyle: const TextStyle(color:Colors.red,fontSize: 13)

            ),
            onSubmitted: (value){
              if (_validator != null) {
                bool checkResult = _validator!.checkText(value);
                if (checkResult) {
                  /*校验通过，不展示error文本*/
                  setState(() {
                    _errorTextDisplay = null;
                  });
                } else {
                  setState(() {
                    _errorTextDisplay = _errorText;
                  });
                }
              }
            },
      );
  }
}


main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
          const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: InputBox(labelText: "Email Address", hintText: "Please Input", errorText: "Error",validator: EmailValidator(),)

    ),
  ));
}
