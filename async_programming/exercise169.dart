Future<void> countdown(int n) async {
  for (var i = n; i >= 0; i--) {
    // Having the await here will make the future complete the delay first then only move on to the next line
    await Future.delayed(
      Duration(seconds: 2),
      () => print(i),
    );
  }
}

Future<void> main() async {
  // Await here is to make sure the future is completed only print Done
  await countdown(5);
  print('Done');
}
