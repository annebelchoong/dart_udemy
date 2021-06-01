import 'item.dart';
import 'product.dart';

class Cart {
  // int is for the product id
  // To list out what item are already in the cart
  final Map<int, Item> _items = {};

  void addProduct(Product product) {
    //calling something that does not exist in the map hence will return null for the first time
    final item = _items[product.id];
    if (item == null) {
      // Adding a new key => {2: 1 x bananas: $0.7}
      _items[product.id] = Item(product: product, quantity: 1);
      print(_items);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  // to check whether the cart is empty without using the private variable
  bool get isEmpty => _items.isEmpty;

  double total() => _items.values
      .map((item) => item.price)
      .reduce((value, element) => value + element)
      .roundToDouble();

  @override
  String toString() {
    if (_items.isEmpty) {
      return 'Cart is empty';
    }
    final itemizedList = _items.keys.map((item) => item.toString()).join('\n');
    return '------\n$itemizedList\nTotal: \$${total()}\n------';
  }
}
