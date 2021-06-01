import 'dart:math';

//Abstract class cannot be instantiated.
//to solve this, need to create a subclass
abstract class Shape {
  double get area;
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => side * side;
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
}

//This allow the subclasses to be passed through and use their properties
void printArea(Shape shape) {
  print(shape.area);
}

void main() {
  // final shape = Shape();
  //Assigning an instance of a subclass to a variable of the parent class
  final Shape square = Square(10);
  //this will work is because square and circle are subclasses of shape
  printArea(square);
  final Shape circle = Circle(5);
  printArea(circle);
  final shapes = [
    Square(2),
    Circle(3),
  ];
  // shapes.forEach((shape) => printArea(shape));
  shapes.forEach(printArea);
}
