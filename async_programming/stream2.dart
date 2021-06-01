Future<void> main() async {
  // This is a single subscption streams therefore only can be call for one method
  final stream = Stream.fromIterable([1, 2, 3]);
  final doubles = stream.map((value) => value * 2).where((value) => value > 3);
  // print(doubles);
  await doubles.forEach(print);

  // to print all the values(iterate)
  // await stream.forEach((element) => print(element));

  // Printing the first value of the list
  // final value = await stream.first;
  // print(value);

  // can pass a list of literals
  // Stream.fromIterable([1, 2, 3]);
  // only contain one value for stream
  // Stream.value(10);
  // Create a stream that contains an error
  // Stream.error(Exception('something went wrong'));
  // Create an empty stream
  // Stream.empty();
  // To allow one value to emits after an delay
  // Stream.fromFuture(Future.delayed(Duration(seconds: 1), () => 42));
  // Create stream that emits event periodically
  // Stream.periodic(Duration(seconds: 1), (index) => index);
}
