extension ListExtensions<T> on List<T> {
  /// Returns a map of the elements of this list, where the keys are the given by [keyGenerator]
  /// and the values are the elements of this list.
  /// If the key is not unique, the last element with the same key will be used.
  Map<K, T> toMap<K>(K Function(T) keyGenerator) {
    return fold<Map<K, T>>({}, (map, element) {
      map[keyGenerator(element)] = element;
      return map;
    });
  }

  /// Returns a new list sorted by the given key function.
  List<T> sortedByKey<K extends Comparable>(K Function(T) key) {
    List<T> sortedList = [...this];
    sortedList.sort((a, b) => key(a).compareTo(key(b)));
    return sortedList;
  }

  /// Returns a new list sorted by the given comparator.
  List<T> sortedBy(Comparator<T> comparator) {
    List<T> sortedList = [...this];
    sortedList.sort(comparator);
    return sortedList;
  }

  /// Returns a new list with the elements of this list that are not in the given list.
  /// this - [other]
  List<T> difference(List<T> other) {
    return where((element) => !other.contains(element)).toList();
  }

  /// Returns a new list with the elements of this list that are in the given list.
  List<T> intersection(List<T> other) {
    return where((element) => other.contains(element)).toList();
  }
}