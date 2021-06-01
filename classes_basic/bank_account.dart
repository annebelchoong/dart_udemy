class BankAccount {
  BankAccount(this._balance);
  //adding a _ infront of the variable will make it private
  double _balance;
  //without this, balance is not able to print because it is private.
  //With this it will be able to pass the variable of _balance into the new variable balance with getter
  double get balance => _balance;

  void deposit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (_balance > amount) {
      _balance += amount;
    }
  }
}
