/*
*
*
* Dart中的库主要有三种：
* 1、自定义库：
*       import 'lib/xxx.dart'
* 2、系统内置库
*       import 'dart:math'
*       import 'dart:io'
*       import 'dart:convert'
*
* */

import 'lib/lib1.dart';
import 'dart:io';
import 'dart:convert';

main() async {
  /*
  * const 声明的常量，如果值一样，那就共用一个存储空间
  * */
  var m1 = const MathSelf(width: 2,height: 3); //单例
  var m2 = const MathSelf(width: 2,height: 3);
  var m3 = const MathSelf(width: 2,height: 43);//单例
  /*
  * m1和m2是一个
  * 但是m3和m1、m2里面的值不同，所以不是同一个
  * */
  /*调用异步操作时，也需要await*/
  //var res = await _getDataFromHttp();
  //print(res);

  const f1 = 3;
  const f2 = 3;

  /*判断两个对象是否指向同一个地址*/
  print(identical(f1, f2)); //true
  print(identical(m1, m2)); //true
  print(identical(m1, m3)); //false
}

/*
* async：标志方法是异步的
* await：等待异步方法执行完成
* 如果调用别的async方法必须使用await方法
*
* */

/*想在_getDataFromHttp中使用异步操作，必须加上async*/
_getDataFromHttp() async {
  var httpClient = HttpClient();

  var uri = Uri.http("www.baidu.com", "");

  var request = await httpClient.getUrl(uri);

  var response = await request.close();

  return await response.transform(utf8.decoder).join();
}
