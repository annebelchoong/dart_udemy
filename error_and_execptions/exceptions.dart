class Fraction {
  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      // throw an exception which will interrupt the program
      throw IntegerDivisionByZeroException();
    }
  }
  final int numerator;
  final int denominator;

  double get value => numerator / denominator;
}

void testFraction() {
  // Recover from the error
  // catch the error using try catch block
  try {
    final f = Fraction(3, 6);
    print(f.value);
    // Handle.IntegerDivisionByZeroException
  } on IntegerDivisionByZeroException catch (e) {
    print(e);
    // it will rethrow the exception after it is process and the program will be interrupted
    rethrow;
    // Handle.Exception
  } on Exception catch (e) {
    print(e);
    // finally will be run regardless if there is an exception or not
  } finally {
    print('testFraction done');
  }
}

void main() {
  testFraction();
  print('done');
}
