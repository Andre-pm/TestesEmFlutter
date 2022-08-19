import 'package:flutter_test/flutter_test.dart';

import 'change_counter.dart';

void main() {
  late ChangeCounter changeCounter;

  setUp(() {
    changeCounter = ChangeCounter();
  });

  group('Testando classe ChangeCounter', () {
    test('Testando o valor inicial', () {
      expect(changeCounter.counter, equals(10));
    }, skip: true);

    test('Testando o increment', () {
      changeCounter.increment();
      expect(changeCounter.counter, equals(1));
    });

    test('Testando o decrement', () {
      changeCounter.decrement();
      expect(changeCounter.counter, equals(-1));
    });
  });
}
