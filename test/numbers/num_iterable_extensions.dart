import 'package:flutter_test/flutter_test.dart';
import 'package:micru_fl_utils/numbers/num_iterable_extensions.dart';

void main() {
  group('Num Iterable Extensions', () {
    final emptyList = <num>[];
    final intList = [1, 2, 3, 4, 5];
    final doubleList = [1.5, 2.5, 3.5, 4.5, 5.5];

    test('sum', () {
      expect(emptyList.sum(), 0);
      expect(intList.sum(), 15);
      expect(doubleList.sum(), 17.5);
    });

    test('avg', () {
      expect(emptyList.avg(), 0);
      expect(intList.avg(), 3);
      expect(doubleList.avg(), 3.5);
      expect(emptyList.avg(ifEmpty: 1), 1);
    });

    test('max', () {
      expect(emptyList.max(), 0);
      expect(intList.max(), 5);
      expect(doubleList.max(), 5.5);
      expect(emptyList.max(ifEmpty: 1), 1);
    });

    test('min', () {
      expect(emptyList.min(), 0);
      expect(intList.min(), 1);
      expect(doubleList.min(), 1.5);
      expect(emptyList.min(ifEmpty: 1), 1);
    });

    test('range', () {
      expect(emptyList.range(), 0);
      expect(intList.range(), 4);
      expect(doubleList.range(), 4);
      expect(emptyList.range(ifEmpty: 1), 0);
    });

    test('median', () {
      expect(emptyList.median(), 0);
      expect(intList.median(), 3);
      expect(doubleList.median(), 3.5);
      expect(emptyList.median(ifEmpty: 1), 1);
      expect([1, 2, 3, 4].median(), 2.5);
    });

    test('product', () {
      expect(emptyList.product(), 1);
      expect(intList.product(), 120);
      expect(doubleList.product(), 324.84375);
      expect(emptyList.product(ifEmpty: 0), 0);
    });
  });
}
