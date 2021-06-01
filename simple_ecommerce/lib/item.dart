import 'product.dart';

class Item {
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;

  // use getter to get the price
  double get price => quantity * product.price;

  @override
  String toString() => '$quantity x ${product.name}: \$$price';
}
