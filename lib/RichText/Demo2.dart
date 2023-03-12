import 'package:flutter/material.dart';

/*
* Flutter 提供了和 Android 类似的 Canvas 绘制方法，但是 Canvas
* 却不支持 drawText，如果想要实现绘制文字，就需要 TextPainter
* 而其内部主要是由 TextSpan 实现。
*
* 使用 TextPainter 时需要继承 CustomPainter，、
* 并实现 paint 和 shouldRepaint 方法，主要是在 paint 中进行绘制。
*
* TextPainter 绘制需要实现 layout 与 paint 方法，即绘制位置与绘制范围。
*
* 每当我们使用Text组件时，它实际上创建的是RichText组件。但是RichText和Text不同的是，
* Text将String作为参数，而RichText将InlinSpan作为参数（或者说是TextSpan）。
*
*
*
* */

import 'dart:ui' as ui;

class TextPainter extends CustomPainter{

  //创建段落构建器
  ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(fontWeight: FontWeight.bold, fontSize: 16))
        ..pushStyle(ui.TextStyle(color: Colors.black))
        ..addText('通过drawParagraph绘通过drawPaaraph绘通过drawParagraph绘通过drawPaaraph绘制的HelloTa通过drawParagraph绘制的制的HelloTa通过drawParagraph绘制的 Hello Ta');

  @override
  void paint(Canvas canvas, Size size) {
    //设置段落宽度
    ui.ParagraphConstraints paragraphConstraints =
        ui.ParagraphConstraints(width: size.width);
    //计算绘制的文本位置及尺寸
    ui.Paragraph paragraph = paragraphBuilder.build()
      ..layout(paragraphConstraints);
    //绘制
    canvas.drawParagraph(paragraph, const Offset(0.0, 0.0));


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  
}

class TextPainterDemo extends StatelessWidget {
  const TextPainterDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: CustomPaint(painter: TextPainter()));
  }
}

class TextPainterDemo2 extends StatelessWidget {
  const TextPainterDemo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RichText(
    text: TextSpan(
    style: Theme.of(context)
      .textTheme
      .bodyText1?.copyWith(fontSize: 44),
   children:const [
          TextSpan(text: 'Taxze ',),
          TextSpan(text: 'blog', style: TextStyle(color: Colors.blue)),
          TextSpan(text: ' Flutter',),
          TextSpan(text: '稀土掘金', style: TextStyle(color: Colors.blue)),
        ]));
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



/**
 * https://mp.weixin.qq.com/s/whri3kskHFTEDer0ub51Jw
 * */
class TextRichDemo3 extends StatelessWidget {
  const TextRichDemo3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Flutter is"),
          const WidgetSpan(
            child: SizedBox(
              width: 120,
              height: 50,
              child: Card(
                color: Colors.blue,
                child:Center(child: Text("Hello world"),)
              ),
          )),
          /** WidgetSpan 支持在文本中插入任意控件*/
          WidgetSpan(
              child: SizedBox(
                width:  300,
                height: 300,
                child:  Image.network(_src1,fit:BoxFit.cover,)),),
          const TextSpan(text: 'the best!'),
        ]
      )
    );
  }
}





main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
          title:
          const Text("Flutter Project1", style: TextStyle(fontSize: 30))),
      body: const TextRichDemo3(),
    ),
  ));
}

