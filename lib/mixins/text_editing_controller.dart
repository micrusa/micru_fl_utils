import 'package:flutter/widgets.dart';

mixin TextEditingControllerMixin<T extends StatefulWidget> on State<T> {
  Map<String, TextEditingController> _controllers = {};

  /// Returns a [TextEditingController] for the given key.
  TextEditingController textEditingController(String key, {String? text}) {
    return _controllers.putIfAbsent(
        key, () => TextEditingController(text: text));
  }

  /// Initializes controllers from the given map.
  /// Useful if you want to add data at startup. (e.g. from a remote API).
  void initTextEditingControllers(Map<String, String> data) {
    _controllers.addAll(data.map(
        (key, value) => MapEntry(key, TextEditingController(text: value))));
  }

  @override
  void dispose() {
    // Dispose all controllers to prevent memory leaks
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  /// For testing purposes only - injects a controller into the internal map
  @visibleForTesting
  void injectControllerForTest(String key, TextEditingController controller) {
    _controllers[key] = controller;
  }
}
