import 'package:flutter_test/flutter_test.dart';
import 'package:micru_fl_utils/misc/let_extension.dart';

void main() {
  group('LetExtension', () {
    test('returns lambda result for non-null object', () {
      final result = 'test'.let((it) => it.length);
      expect(result, equals(4));
    });

    test('returns ifNull value for null object', () {
      String? nullString;
      final result = nullString.let((it) => it.length, ifNull: -1);
      expect(result, equals(-1));
    });

    test('returns null for null object without ifNull value', () {
      String? nullString;
      final result = nullString.let((it) => it.length);
      expect(result, isNull);
    });
  });
}
