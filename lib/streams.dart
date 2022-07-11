Stream<int> createStreamOfInt() async* {
  for (int i = 1; i <= 10; i++) {
    yield i;
  }
}

Future<int> useStream(Stream<int> stream) async {
  var sum = 0;

  await for (final value in stream) {
    sum += value;
  }

  return sum;
}

Future<void> streamCalculation() async {
  var stream = createStreamOfInt();

  var sum = await useStream(stream);

  print(sum);
}
