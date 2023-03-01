/*
* 泛型
* */
import 'Person.dart';

T getName<T>(T name) {
  return name;
}


class Hint<T>{
  late T name;
}

abstract class AbsHint<T>{
  late T name;
  void printInfo();
}

class MyHint<T> implements AbsHint<T>{
  @override
  late T name;

  @override
  void printInfo() {
    // TODO: implement printInfo
  }



}

main(){
  var hint = Hint();
  var hint1 = Hint<String>();


}













