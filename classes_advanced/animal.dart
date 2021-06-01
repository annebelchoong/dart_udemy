//superclass
class Animal {
  //This constructor will not be passed to the subclasses hence need to create super constructor for each subclass
  const Animal({required this.age});
  final int age;

  void sleep() => print('sleep');

  //Examples:
  // void eat() => print('eat');
  // void move() => print('move');
}

//subclassing or inheritance
//subclasses is able to use the properties in Animal because it is extended from animals
class Dog extends Animal {
  //super constructor in the initialize list
  //super() call the constructor in the superclass
  //Declare an argument in the Dog() to pass variable to the super constructor
  Dog({required int age}) : super(age: age);

  void bark() => print('bark');
  //When want to override, it's best to add the anotation @override
  @override
  void sleep() {
    //calling the sleep method in superclass
    super.sleep();
    print('sleep some more');
  }
}

class Cow extends Animal {
  Cow({required int age}) : super(age: age);
  void moo() => print('moo');
}

class CleverDog extends Dog {
  CleverDog({required int age}) : super(age: age);
  void catchBall() => print('catch');
}

void main() {
  final animal = Animal(age: 10);
  animal.sleep();
  final dog = Dog(age: 10);
  dog.sleep();
}
