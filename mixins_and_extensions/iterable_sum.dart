// change from int to num because both int and double are under num so it will allow both type to be used
// extension IterablesX on Iterable<num> {
//   num sum() => reduce((value, element) => value + element);
// }

// void main() {
// .sum() is not a method inside the list or iterable class, hence we create an extension
//   final sum1 = [1, 2, 3].sum();
//   final sum = [1.0, 2.0, 3.0].sum();
//   print(sum);
//   print(sum1);
// }

// after changin to num, the sum cannot be declare as int or double. To solve this

extension IterablesX<T extends num> on Iterable<T> {
  T sum() => reduce((value, element) => (value + element) as T);
}

void main() {
  // The return type will match the types of the value in the list
  int sum1 = [1, 2, 3].sum();
  double sum = [1.0, 2.0, 3.0].sum();
  print(sum);
  print(sum1);
}
