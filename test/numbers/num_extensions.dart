import 'package:flutter_test/flutter_test.dart';
import 'package:micru_fl_utils/numbers/num_extensions.dart';

class TestNumExtensions {
  static void run() {
    group('Num Extensions', () {
      test('toStringWithLimitedDecimals', () {
        expect(1.toStringWithLimitedDecimals(2), "1");
        expect(1.327.toStringWithLimitedDecimals(2), "1.32");
        expect(1.3001.toStringWithLimitedDecimals(2), "1.3");
        expect(1.3100.toStringWithLimitedDecimals(4), "1.31");
      });
    });
  }
}
