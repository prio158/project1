class MathSelf {
  final int width;
  final int height;

  /*常量构造函数，属性必须用final修饰  单例模式*/
  const MathSelf({required this.width, required this.height});

  void printInfo() {
    print("Math Info");
  }
}
