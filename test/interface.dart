/*普通类和抽象类都可以用作接口，而不是interface
* 1、使用implements关键字实现，但是如果是普通类实现，会将普通类
* 和抽象中的属性全部覆写一遍，所以不建议用。
*
* 2、如果要实现JAVA中的接口，用抽象类做接口:约定、规范
*/
abstract class DB{
  late String url;
  add();
  save();
  delete();
}

class MySql implements DB{

  MySql.create(String this.url);

  @override
  add() {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  save() {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  late String url ;

}
