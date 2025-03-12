import 'package:flutter/widgets.dart';

/// A mixin that provides multiple loading states to a [StatefulWidget].
/// The loading state is unique to the function instance, so you can have multiple
/// functions (or buttons) with their own loading state.
mixin LoadingStateMixin<T extends StatefulWidget> on State<T> {
  final Map<int, ValueNotifier<bool>> _loadingStates = {};

  /// Returns a function that wraps the given function with loading state.
  /// The loading state is unique to the function instance.
  Future<void> withLoading(Future<void> Function() function) async {
    final loadingState = getLoadingState(function);
    if (loadingState.value) {
      return;
    }

    loadingState.value = true;
    try {
      return await function();
    } finally {
      loadingState.value = false;
    }
  }

  /// Returns a function that wraps the given function with a global loading state.
  /// If any of the loading states are `true`, the function will not be executed.
  /// Useful if you want to prevent multiple functions firing at the same time.
  Future<void> withGlobalLoading(Future<void> Function() function) async {
    if (isAnyLoading()) {
      return;
    }

    final localLoadingState = getLoadingState(function);
    localLoadingState.value = true;
    try {
      return await function();
    } finally {
      localLoadingState.value = false;
    }
  }

  /// Returns `true` if any of the loading states are `true`.
  bool isAnyLoading() {
    return _loadingStates.values.any((state) => state.value);
  }

  /// Gets the loading state for a specific function
  ValueNotifier<bool> getLoadingState(Future<void> Function() function) {
    return _loadingStates.putIfAbsent(
        function.hashCode, () => ValueNotifier(false));
  }

  @override
  void dispose() {
    for (final state in _loadingStates.values) {
      state.dispose();
    }
    _loadingStates.clear();
    super.dispose();
  }
}
