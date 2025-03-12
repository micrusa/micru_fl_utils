extension NumIterableExtensions<T extends num> on Iterable<T> {
  /// Returns the sum of all elements in the iterable.
  T sum() => fold(T == int ? 0 as T : 0.0 as T,
      (previous, element) => (previous + element) as T);

  /// Returns the average of all elements in the iterable.
  num avg({num? ifEmpty}) => isEmpty ? ifEmpty ?? 0 : sum() / length;

  /// Returns the maximum value in the iterable or 0 if the iterable is empty.
  T max({T? ifEmpty}) => isEmpty
      ? (ifEmpty ?? 0.0 as T)
      : reduce((value, element) => value > element ? value : element);

  /// Returns the minimum value in the iterable or 0 if the iterable is empty.
  T min({T? ifEmpty}) => isEmpty
      ? (ifEmpty ?? 0.0 as T)
      : reduce((value, element) => value < element ? value : element);

  /// Returns the range of the iterable (max - min).
  num range({T? ifEmpty}) => max(ifEmpty: ifEmpty) - min(ifEmpty: ifEmpty);

  /// Returns the median of the iterable.
  num median({T? ifEmpty}) {
    if (isEmpty) return ifEmpty ?? 0.0;
    var sortedList = toList()..sort();
    var middle = sortedList.length ~/ 2;
    if (sortedList.length.isOdd) {
      return sortedList[middle].toDouble();
    } else {
      return (sortedList[middle - 1] + sortedList[middle]) / 2;
    }
  }

  /// Returns the product of all elements in the iterable.
  num product({num? ifEmpty}) => isEmpty
      ? (ifEmpty ?? 1.0)
      : fold(1.0, (previous, element) => previous * element);
}
