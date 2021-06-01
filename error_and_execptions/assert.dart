class PositiveInt {
  // Use assertion to provide information of what went wrong
  const PositiveInt(this.value)
      : assert(value >= 0, 'Value cannot be negative');
  final int value;
}

void signIn(String email, String password) {
  // Assert helps to catch programmer error early
  assert(email.isNotEmpty);
  assert(password.isNotEmpty);
}

void main() {
  // Error
  const list = [1, 2, 3];
  print(list[4]);
  signIn('', '');
  // putting const allow to see compile time error
  // const invalidAge = PositiveInt(-1);
  // print(invalidAge);
}
