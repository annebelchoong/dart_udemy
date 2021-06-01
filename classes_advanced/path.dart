import 'dart:math';

class ClosedPath {
  List<Point> _points = [];

// moving one point to the list
  void moveTo(Point point) {
    _points = [point];
  }

  void lineTo(Point point) {
    _points.add(point);
  }
}

void main() {
  final path = ClosedPath()
    // Using cascade operator for only mutable (can use when the variable is nullable by adding ?..)
    ..moveTo(Point(0, 0))
    ..lineTo(Point(2, 0))
    ..lineTo(Point(2, 2))
    ..lineTo(Point(0, 2))
    ..lineTo(Point(0, 0));
  // square shape same as above
  // path.moveTo(Point(0, 0));
  // path.lineTo(Point(2, 0));
  // path.lineTo(Point(2, 2));
  // path.lineTo(Point(0, 2));
  // path.lineTo(Point(0, 0));
}
