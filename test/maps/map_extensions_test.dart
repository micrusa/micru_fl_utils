import 'package:flutter_test/flutter_test.dart';
import 'package:micru_fl_utils/maps/map_extensions.dart';

void main() {
  group('MapExtensions', () {
    test('copy() should create a new map with the same keys and values', () {
      final original = {'key1': 'value1', 'key2': 'value2'};
      final copy = original.copy();

      // Check that the copy has the same contents
      expect(copy, equals(original));

      // Check that it's a different instance
      expect(identical(copy, original), isFalse);

      // Modifying the copy should not affect the original
      copy['key3'] = 'value3';
      expect(original.containsKey('key3'), isFalse);
    });

    test('addAll() should add all entries from the given map', () {
      final map1 = {'key1': 'value1', 'key2': 'value2'};
      final map2 = {'key3': 'value3', 'key4': 'value4'};

      map1.addAll(map2);

      // Check that all keys from map2 are in map1
      for (var key in map2.keys) {
        expect(map1.containsKey(key), isTrue);
        expect(map1[key], equals(map2[key]));
      }

      // Check that existing keys in map1 are still there
      expect(map1['key1'], equals('value1'));
      expect(map1['key2'], equals('value2'));
    });

    test('addAll() should update existing keys', () {
      final map1 = {'key1': 'value1', 'key2': 'value2'};
      final map2 = {'key2': 'newValue2', 'key3': 'value3'};

      map1.addAll(map2);

      // Check that the value for key2 is updated
      expect(map1['key2'], equals('newValue2'));

      // Check that key1 and key3 are still there with correct values
      expect(map1['key1'], equals('value1'));
      expect(map1['key3'], equals('value3'));
    });
  });
}
