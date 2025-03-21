import 'package:flutter/widgets.dart';

extension WidgetExtensions on Widget {
  /// Wraps the widget with a [Padding] widget.
  Widget withPadding(EdgeInsets edgeInsets) {
    return Padding(padding: edgeInsets, child: this);
  }

  /// Wraps the widget with a [SizedBox] widget of given [width] and [height].
  Widget withSize({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }

  /// Wraps the widget with a [Center] widget.
  Widget centered() {
    return Center(child: this);
  }

  /// Wraps the widget with a [Expanded] widget.
  Widget expanded({int? flex}) {
    return Expanded(flex: flex ?? 1, child: this);
  }

  /// Wraps the widget with a [Flexible] widget.
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(flex: flex, fit: fit, child: this);
  }
}