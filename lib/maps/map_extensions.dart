extension MapExtensions<K,V> on Map<K, V> {
  /// Returns a new map with the same keys and values as this map.
  Map<K, V> copy() {
    return Map<K, V>.from(this);
  }

  /// Adds all the entries from the given map to this map.
  /// If the key already exists, the value will be updated.
  void addAll(Map<K, V> other) {
    for (var entry in other.entries) {
      this[entry.key] = entry.value;
    }
  }
}