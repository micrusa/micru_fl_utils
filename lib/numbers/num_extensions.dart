import 'dart:math';

extension NumExtensions on num {
  /// Returns a String with maximum [maxDecimals] decimals, removing trailing zeros.
  String toStringWithLimitedDecimals(int maxDecimals) {
    if (this == toInt() || maxDecimals == 0) return toInt().toString();
    double truncated =
        (this * pow(10, maxDecimals)).toInt() / pow(10, maxDecimals);
    return truncated.toStringAsFixed(maxDecimals).replaceAll(RegExp(r'\.?0*$'), '');
  }
}
