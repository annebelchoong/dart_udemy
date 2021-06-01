class Point {
  Point(this.x, this.y);
  final int x;
  final int y;

// allow to print it to string which is readable
// useful for modal class
  @override
  String toString() => 'Point($x, $y)';

// to allow dart to operates the equality operator when == is called
  @override
  //Object overload
  // bool operator ==(Object other) {
  // to check if the other type is point at runtime
  // if (other is Point) {
  /* the other is able to use .x and .y because once the code 
       checked that it IS a Point, then it will promote the the 
       given type which is Point inside the if statement */
//       return x == other.x && y == other.y;
//     }
//     return false;
//   }
// }

  // by using covariant, it helps to change the type of an argument when overriding a method
  //which means it is telling Dart that i will only overrride this when the argument type is Point
  bool operator ==(covariant Point other) {
    return x == other.x && y == other.y;
  }
}

void main() {
  // print(Point(1, 1));
  // final list = [Point(1, 2), Point(3, 4)];
  // print(list);

  // Dart is unable to use the equity operator for a new type
  print(Point(0, 0) == Point(0, 0));
  // comparing with string literals
  // print(Point(0, 0) == 'abc');
}
