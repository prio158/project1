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


/**
 * @param hintText 提示暗文
 * @param labelText 输入框类型文本
 * @param errorText 错误文本提示
 * @param validator 文本校验
 * */
class InputBox extends StatefulWidget {
  final  String? hintText;
  final String? labelText;
  final String? errorText;
  final Validator? validator;

  const InputBox({Key? key, this.hintText, this.labelText, this.errorText, this.validator}) : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  String? hintText;
  String? labelText;
  String? errorText;
  Validator? validator;
  String? errorTextDisplay;
  Color borderColor = Colors.grey;

  @override
  void initState() {
    hintText =  widget.hintText;
    errorText = widget.errorText;
    validator = widget.validator;
    labelText = widget.labelText;

    _focusNode.addListener(() {
      /** 输入框被选中*/
      if (_focusNode.hasFocus) {
        setState(() {
          borderColor = Colors.blue;
          errorTextDisplay = null;
        });
      } else {
        setState(() {
          borderColor = Colors.grey;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    /** 错误: 红色*/
    if(errorTextDisplay!=null){
      borderColor = Colors.red;
    }

    return TextField(
            autofocus: false,
            focusNode: _focusNode,
            style: const TextStyle(color: Colors.black,fontSize: 20) ,
            decoration:  InputDecoration(
              /** 未聚焦时的边框设置*/
              enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color:borderColor ?? Colors.grey,width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              /** 聚焦后的边框设置*/
              focusedBorder:OutlineInputBorder(
                borderSide:  BorderSide(color:borderColor ?? Colors.blue,width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: labelText,
              labelStyle: TextStyle(color:borderColor,fontSize: 16),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle:const TextStyle(color:Colors.grey,fontSize: 20),
              helperText: errorTextDisplay,
              helperStyle: const TextStyle(color:Colors.red,fontSize: 13)
            ),
            onSubmitted: (value){
              if (validator != null) {
                bool checkResult = validator!.checkText(value);
                if (checkResult) {
                  /*校验通过，不展示error文本*/
                  setState(() {
                    errorTextDisplay = null;
                  });
                } else {
                  setState(() {
                    errorTextDisplay = errorText;
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
