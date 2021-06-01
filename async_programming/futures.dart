Future<String> fetchUserOrder() => Future.delayed(
      // Future.delayed is the factory constructor of the future
      Duration(seconds: 2),
      // returning by using a anonymous function
      () => 'Cappuccino',
      // () => throw Exception('Out of milk')
    );

// Use this future.value when we want it to complete immediatly
Future<String> fetchUserOrder2() => Future.value('Espresso');

// show error immediately after the delayed
Future<String> fetchUserOrder3() => Future.error(Exception('Out of milk'));

Future<void> main() async {
  print('Program started');
  // Awaits must be in an async function
  try {
    // Add await to wait for the future to complete then return the value
    final order = await fetchUserOrder();
    print(order);
    final order2 = await fetchUserOrder3();
    print(order2);
  } catch (e) {
    print(e);
  } finally {
    print('Done');
  }
  // Using then, catchError, whenComplete
  // fetchUserOrder()
  //     .then((order) => print('Order is ready: $order'))
  //     .catchError((error) => print(error))
  //     .whenComplete(() => print('Done'));
}
