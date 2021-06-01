// MY ANSWER
// class EmailAddress {
//   EmailAddress(this.emailAddress) {
//     if (emailAddress == '' || !emailAddress.contains('@')) {
//       throw FormatException("$emailAddress doesn't contain the @ symbol");
//     }
//   }
//   final String emailAddress;
// }

// void main() {
//   try {
//     print(EmailAddress('me@example.com').emailAddress);
//     print(EmailAddress('example.com').emailAddress);
//     print(EmailAddress('').emailAddress);
//   } on FormatException catch (e) {
//     print(e);
//   }
// }

// ANDREA ANSWER
class EmailAddress {
  EmailAddress(this.emailAddress) {
    // Assertion -> programming error
    // assert(emailAddress.isEmpty);
    // assert(!emailAddress.contains('@'));
    // Exception -> invalid email address
    if (emailAddress.isEmpty) {
      throw FormatException("email can't be empty");
    }
    if (!emailAddress.contains('@')) {
      throw FormatException("$emailAddress doesn't contain the @ symbol");
    }
  }
  final String emailAddress;

  @override
  String toString() => emailAddress;
}

void main() {
  try {
    print(EmailAddress('me@example.com'));
    print(EmailAddress('example.com'));
    print(EmailAddress(''));
  } on FormatException catch (e) {
    print(e);
  }
}
