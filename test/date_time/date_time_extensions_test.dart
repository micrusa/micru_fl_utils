import 'package:flutter_test/flutter_test.dart';
import 'package:micru_fl_utils/date_time/date_time_extensions.dart';

void main() {
  group('DateTimeExtensions', () {
    group('equalsDate', () {
      test('returns true for same dates with different times', () {
        final date1 = DateTime(2023, 12, 25, 10, 30);
        final date2 = DateTime(2023, 12, 25, 15, 45);

        expect(date1.equalsDate(date2), isTrue);
      });

      test('returns false for different dates', () {
        final date1 = DateTime(2023, 12, 25);
        final date2 = DateTime(2023, 12, 26);

        expect(date1.equalsDate(date2), isFalse);
      });

      test('returns true for same dates in different timezones', () {
        final date1 = DateTime.utc(2023, 12, 25, 12);
        final date2 = DateTime(2023, 12, 25, 12);

        expect(date1.equalsDate(date2), isTrue);
      });
    });
  });
}
