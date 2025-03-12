extension DateTimeExtensions on DateTime {
  /// Returns 'true' if the date (ignoring the time) equals [other].
  /// The comparison is done in UTC, to ignore timezone differences.
  bool equalsDate(DateTime other) {
    final utcThis = toUtc();
    final utcOther = other.toUtc();
    return utcThis.year == utcOther.year &&
        utcThis.month == utcOther.month &&
        utcThis.day == utcOther.day;
  }
}
