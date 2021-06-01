class Credential {
  const Credential({this.email = '', this.password = ''});
  final String email;
  final String password;

// copyWith a method that takes 2 name argument
  Credential copyWith({
    String? email,
    String? password,
  }) {
    return Credential(
      // if email is not null, it wil use the email that is passed through or not it will use this.email
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => 'Credentials($email, $password)';
}

void main() {
  const credentials = Credential();
  // credential.email = 'me@example.com';
  final update1 = credentials.copyWith(email: 'me@example.com');
  print(update1);
  final update2 = update1.copyWith(password: 'easy-copy');
  print(update2);
}
