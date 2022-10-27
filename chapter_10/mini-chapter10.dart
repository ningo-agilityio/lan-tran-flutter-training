Future<void> main() async {
  // try-catch block
  try {
    final message = await Future<String>.delayed(
      Duration(seconds: 2),
      () => 'I am from the future',
    );
    print(message);
  } catch (error) {
    print(error);
  } finally {
    print('Completed.');
  }

  // stream: return an integer every second 10 times
  final myStream = Stream<int>.periodic(
    Duration(seconds: 1),
    (value) => value,
  ).take(10);

  // await for print stream
  await for (var integer in myStream) {
    print(integer);
  }
}
