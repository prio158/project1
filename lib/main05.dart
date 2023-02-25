import 'package:flutter/material.dart';

const _src =
    "https://lmg.jj20.com/up/allimg/1113/052420110515/200524110515-2-1200.jpg";

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(color: Colors.yellow),
        child: Image.network(
          _src,
          scale: 2,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ImageViewCircle extends StatelessWidget {
  const ImageViewCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        width: 150,
        height: 150,
        decoration:  BoxDecoration(
          color: Colors.yellow,
          borderRadius:BorderRadius.circular(20),
          image: const DecorationImage(image: NetworkImage(_src), fit: BoxFit.cover, ),
        ),
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
        body: Column(
          children: const [ImageViewCircle()],
        )),
  ));
}
