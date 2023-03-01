import 'Person.dart';

main() {
  var p1 = Person("czs", 23);
  print(p1.name + p1.age.toString());

  Person.birth = "dsds";
  var p2 = Person.create();
  print(p2.name + p2.age.toString());
  p1.info = "man";
  print(p1.info);

  /*.. 连缀操作符号*/
  p1..age = 13
    ..name = "str"
    ..printINFO();

  var p3 = Web3();
}
