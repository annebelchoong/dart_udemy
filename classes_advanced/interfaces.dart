abstract class InterfaceA {
  void a();
}

abstract class InterfaceB {
  void b();
}

// extend and implements are the same
// The main difference is implement can extend more than 1 superclass while
// extend can only extend 1 superclass
class AB implements InterfaceA, InterfaceB {
  @override
  void a() {}

  @override
  void b() {}
}

abstract class Base {
  void foo(); // Abstract method
  void bar() => print('bar'); //Concrete methods
}

//For extends, since bar already has implementation, then no need to impliment again in subclass
class Subclass extends Base {
  @override
  void foo() => print('foo');
}

// but for implements, all the abstract method must be overrride
class Subclass1 implements Base {
  @override
  void foo() => print('foo');

  @override
  void bar() => print('bar');
}
