import 'package:flutter/widgets.dart';

/// A mixin that provides multiple loading states to a [StatefulWidget].
/// The loading state is unique to the function instance, so you can have multiple
/// functions (or buttons) with their own loading state.
mixin LoadingStateMixin<T extends StatefulWidget> on State<T> {
  Map<int, bool> _loadingStates = {};

  void _setStateOf(int key, bool value) {
    setState(() {
      _loadingStates = {
        ..._loadingStates,
        key: value,
      };
    });
  }

  /// Returns a function that wraps the given function with loading state.
  /// The loading state is unique to the function instance.
  Future<K> Function()? withLoading<K>(Future<K> Function() function,
      {int? key}) {
    key ??= 1;
    final loadingState = isLoading(key);
    if (loadingState) {
      return null;
    }

    return () async {
      _setStateOf(key!, true);
      final result = await function();
      _setStateOf(key, false);
      return result;
    };
  }

  /// Returns a function that wraps the given function with a global loading state.
  /// If any of the loading states are `true`, the function will not be executed.
  /// Useful if you want to prevent multiple functions firing at the same time.
  Future<K> Function()? withGlobalLoading<K>(Future<K> Function() function, {int? key}) {
    key ??= 1;
    if (isAnyLoading()) {
      return null;
    }

    return () async {
      _setStateOf(key!, true);
      final result = await function();
      _setStateOf(key, false);
      return result;
    };
  }

  /// Returns `true` if any of the loading states are `true`.
  bool isAnyLoading() {
    return _loadingStates.values.any((state) => state);
  }

  /// Gets the loading state for a specific function
  bool isLoading(int key) {
    return _loadingStates.putIfAbsent(key, () => false);
  }
}
