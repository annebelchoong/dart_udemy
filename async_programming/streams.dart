Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  // Add await because working with stream which we need to await for each value to be available before we can use it
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

Future<int> sumStream2(Stream<int> stream) =>
// Same as iterables reduce but the stream.reduce will wait for each even to be available before calling the combine function
    // Here no need to use async and await because both stream and stream.reduce return a Future
    stream.reduce((previous, element) => previous + element);

// Stream generator/ asychronous
Stream<int> countStream(int n) async* {
  for (var i = 1; i <= n; i++) {
    // some asynchronous work
    await Future.delayed(Duration(seconds: 1));
    print(i);
    // can call yield multiple time to generate a Stream
    yield i;
  }
}

// synchronous similar to stream generator without await
Iterable<int> count(int n) sync* {
  for (var i = 1; i <= n; i++) {
    yield i;
  }
}

Future<void> main() async {
  // Stream return function asyncroniously
  final stream = Stream<int>.fromIterable([1, 2, 3, 4]);
  // This expression will create number from 1 to 4
  final stream2 = countStream(4);
  // THis expression will calculate the sum
  final sum = await sumStream2(stream2);
  print('Sum: $sum');
}
