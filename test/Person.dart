class Person{
  /*默认是公有的*/
  String name = "opo";
  int age =12;
  /*静态属性*/
  static String birth ="";
  /*私有属性:加下划线，但是这个Person这个类必须被抽成一个文件*/
   String _sex= "women";

  /*默认构造函数*/
  Person(this.name,this.age);

  /*默认构造函数的默认赋值*/
  //Person():name="ds",age=13;

  /*as：类型转化*/


  /*命名构造函数,可以写多个，多种实例化方法*/
  Person.create(){
    print("命名构造函数");
  }

  /*访问私有的东西的做法：计算属性*/
  get info{
    return _sex;
  }
  /*设置私有的东西的做法：计算属性*/
  set info(value){
    _sex = value;
  }

  /*私有方法:加下划线，但是这个Person这个类必须被抽成一个文件*/
  void _printInfo(){

  }

  /*静态方法*/
  static void printSB(){

  }

  void printINFO(){

  }

}

class Web extends Person{
  Web(super.name, super.age);

}

class Web3 extends Person{
  Web3():super.create();

  @override
  void printINFO() {
    // TODO: implement printINFO
    super.printINFO();
  }

  /*私有方法都可以复写*/
  @override
  void _printInfo() {
    // TODO: implement _printInfo
    super._printInfo();
  }

}

/*抽象类 */
abstract class AbsActivityV3{
   void onCreate();
}

