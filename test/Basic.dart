// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


var value2 =100;
void main() {

  functionTest(30,23,"man");
  functionTest(30,13);
  functionTest(30);
  functionTest2(22,age:12,sex:"daz");

  /*闭包*/
  var s = "ssss";
  fun2((value){
    print(s);
    value2++;
    print(value);
    print(value2);
    print("gggb");
  });

  fun2((value){
    print(s);
    value2++;
    print(value);
    print(value2);
    print("gggb");
  });





  fn4();
}

/*不知道返回类型，也就是返回任意类型：不写返回类型*/
test(){}
/*建议返回类型、参数类型都写上*/
/*可选参数:[int? age,String? sex]*/
/*默认参数：[int? age,String sex="nv"]*/
void functionTest(int? sum,[int? age,String sex="nv"]){
  return;
}

/*
*  命名参数
*  functionTest2(22,age: 12,sex: "daz");
* */
void functionTest2(int? sum,{int? age,String sex="nv"}){
  return;
}

/*回调*/
fun1(){
  print("fun1");
}
/*定义匿名方法*/
var fn3 = (){
  print("fun3");
};

fun2(fn){
  print("fun2:$value2");
  fn(value2);
}

var fn4 = fun1;







/*数据结构的例子*/
void dataStruct(){
  /*List*/
  var l12 = [];
  var s = List.filled(2, "sb");
  if (s is List<int>) {}


  /*三目*/
  var flag = true;
  var str = flag==null ? 'W' : 'F';
  print(str);

  /*左边 ?? 右边 ====>如果左边的逻辑为空，就走右边的逻辑*/
  var a = 1;
  var b = a ?? 10;
  print("??:$b");

  /*类型转换*/
  String? price="23";
  var num = int.parse(price); //字符串不是数字时或者null，会崩溃
  print(num);
  var str1 = 1234.toString();
  print(str1 is String);
  var doubleNum = '123.2';
  print(double.parse(doubleNum) is double);
  price = null;
  price?.isEmpty;
  price == null;

  /*map*/
  var person = {"name": "czr", "age": 20};
  print(person.keys);
  print(person.entries);
  person["sex"] = "nan";
  print(person);

  /*List*/
  var list = [1,2,3,4,1];
  var list_rerse = list.reversed.toList();
  list.fillRange(0,2,8);
  var str2 =  list.join("=");
  print(str2); //String字符串
  print(list);
  print(list.where((element) => element<2).toList());
  /*=> 只能写一行*/
  list.where((element){
    return element>3;
  });
  print(list.map((element) => element<2).toList());
  /*只要有一个满足条件，就返回true*/
  print(list.any((element) =>element>5));
  /*每一个满足条件，就返回true*/
  print(list.every((element) =>element>5));



  /*Set*/
  var set = Set();
  set.add("ds");
  set.addAll(list);
  print(set);
  print(set.toList());


  /*map*/
  var maps = <String,String>{
    "1": "v1",
    "2": "v2",
    "3": "v3",
    "2": "v4" //这个会覆盖上面的那个
  };
  maps.keys.forEach((element) {});
  maps.values.toList();
  maps.remove("1");
  print(maps);


}
