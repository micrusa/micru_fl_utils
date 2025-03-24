import 'package:flutter_test/flutter_test.dart';
import 'package:micru_fl_utils/lists/list_extensions.dart';

void main() {
  group('ListExtensions', () {
    group('toMap', () {
      test('converts list to map with unique keys', () {
        final list = [1, 2, 3];
        final map = list.toMap((e) => 'key$e');

        expect(
            map,
            equals({
              'key1': 1,
              'key2': 2,
              'key3': 3,
            }));
      });

      test('uses last element when keys are not unique', () {
        final list = [1, 2, 3];
        final map = list.toMap((e) => 'key');

        expect(map, equals({'key': 3}));
      });
    });

    group('sortedByKey', () {
      test('sorts list by key function', () {
        final list = [3, 1, 4, 2];
        final sorted = list.sortedByKey((e) => e);

        expect(sorted, equals([1, 2, 3, 4]));
      });

      test('maintains original list unchanged', () {
        final list = [3, 1, 4, 2];
        final original = [...list];
        list.sortedByKey((e) => e);

        expect(list, equals(original));
      });
    });

    group('sortedBy', () {
      test('sorts list by comparator', () {
        final list = ['banana', 'apple', 'cherry'];
        final sorted = list.sortedBy((a, b) => a.compareTo(b));

        expect(sorted, equals(['apple', 'banana', 'cherry']));
      });

      test('maintains original list unchanged', () {
        final list = ['banana', 'apple', 'cherry'];
        final original = [...list];
        list.sortedBy((a, b) => a.compareTo(b));

        expect(list, equals(original));
      });
    });

    group('difference', () {
      test('returns elements not in other list', () {
        final list1 = [1, 2, 3, 4];
        final list2 = [2, 4];

        expect(list1.difference(list2), equals([1, 3]));
      });

      test('returns empty list when all elements are in other list', () {
        final list1 = [1, 2];
        final list2 = [1, 2, 3];

        expect(list1.difference(list2), isEmpty);
      });
    });

    group('intersection', () {
      test('returns elements present in both lists', () {
        final list1 = [1, 2, 3, 4];
        final list2 = [2, 4, 5];

        expect(list1.intersection(list2), equals([2, 4]));
      });

      test('returns empty list when no common elements', () {
        final list1 = [1, 2];
        final list2 = [3, 4];

        expect(list1.intersection(list2), isEmpty);
      });
    });
  });
}
