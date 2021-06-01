import 'dart:io';

import 'package:test/cart.dart';
import 'package:test/product.dart';

// global variable
const allProducts = [
  Product(id: 1, name: 'apples', price: 1.60),
  Product(id: 2, name: 'bananas', price: 0.70),
  Product(id: 3, name: 'courgettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.00),
  Product(id: 5, name: 'mushroom', price: 0.80),
  Product(id: 6, name: 'potatoes', price: 1.50),
];
// loop
//    prompt: view cart/ add item/ checkout
//    if selection == add item
//      choose a product
//      add it to the cart
//      print cart
//    else if selection == view cart
//      print cart
//    else if selection == checkout
//      do checkout
//      exit
//    end

void main() {
  final cart = Cart();
  while (true) {
    stdout.write(
        'What do you want to do? (v)iew items, (a)dd item, (c)heckout: ');
    final line = stdin.readLineSync();
    if (line == 'a') {
      final product = chooseProduct();
      if (product != null) {
        // print(product.name);
        cart.addProduct(product);
        print(cart);
      }
    } else if (line == 'v') {
      print(cart);
    } else if (line == 'c') {
      if (checkout(cart)) {
        break;
      }
    }
  }
}

Product? chooseProduct() {
  final productsList =
      allProducts.map((product) => product.displayName).join('\n');
  stdout.write('Available products: \n$productsList\nYour choice: ');
  final line = stdin.readLineSync();
  for (var product in allProducts) {
    if (product.initial == line) {
      return product;
    }
  }
  print('Not found');
  return null;
}

bool checkout(Cart cart) {
  if (cart.isEmpty) {
    print('Cart is empty');
    return false;
  }
  double total = cart.total();
  print('Total:\$$total');

  // ask if have voucher
  //    if yes
  //      ask for voucher amount in price
  //      if voucher amount < total
  //        new total  = total - voucher
  //        print new total
  //      else if voucher amount == total
  //        Proceed to thank you for shopping with us
  //      else
  //    else if no
  // proceed to payment cash or card,

  stdout.write('Do you have any vouchers? (y/n): ');
  final voucher = stdin.readLineSync();
  if (voucher == 'y') {
    stdout.write('What is the amount to discount?: \$');
    final line = stdin.readLineSync();
    if (line == null || line.isEmpty) {
      return false;
    }
    final voucherAmount = double.tryParse(line)!;
    if (voucherAmount < cart.total()) {
      total -= voucherAmount;
      print('After discount amount: \$$total');
    } else if (voucherAmount == total || voucherAmount > total) {
      print('You have paid with the voucher');
      print('Thank you for shopping with us');
      return true;
    }
  } else if (voucher == null || voucher.isEmpty) {
    return false;
  }

  stdout.write('Payment(cash or card): ');
  final line = stdin.readLineSync();
  if (line == 'cash') {
    stdout.write('Payment Amount: ');
    final line1 = stdin.readLineSync();
    if (line1 == null || line1.isEmpty) {
      return false;
    }
    // Converting string to double number
    final paid = double.tryParse(line1);
    if (paid == null) {
      return false;
    }
    if (paid >= total) {
      final change = paid - total;
      print('Change: \$${change.toStringAsFixed(2)}');
      return true;
    } else {
      print('Not enough cash');
      return false;
    }
  } else if (line == 'card') {
    stdout.write('Please wave your card (y/n): ');
    final line1 = stdin.readLineSync();
    if (line1 == 'y') {
      print('Amount paid: \$$total');
      print('Thank you for shopping with us');
      return true;
    } else {
      return false;
    }
  }
  return false;
}
