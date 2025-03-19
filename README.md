# micru_fl_utils

This package was built to reduce boilerplate code in my apps with useful extensions, functions, etc

## Getting started

Install with `flutter pub add micru_fl_utils` and start using all extensions

## Features

### Date Time
- DateTime.equalsDate(DateTime) => Checks whether day, month and year are equal in two DateTime instances
```dart
DateTime a = DateTime(2000, 1, 1, 23, 59)
DateTime b = DateTime(2000, 1, 1, 02, 23)
// a.equalsDate(b) is true
```

### Mixins
- LoadingStateMixin => Use it to add a "loading" state to a function, can be used to avoid granny clicks (for example).
```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with LoadingStateMixin {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => withLoading(() async {
        // The button will get disabled while the function is running
        await Future.delayed(Duration(seconds: 2));
      }),
      child: Text("Click me"),
    );
  }
}
```

### Widget Extensions
- Widget.withPadding(EdgeInsets) => Wraps the widget with a Padding widget
- Widget.withSize({width, height}) => Wraps the widget with a SizedBox widget
- Widget.centered() => Wraps the widget with a Center widget
- Widget.expanded({flex}) => Wraps the widget with an Expanded widget
- Widget.flexible({flex, fit}) => Wraps the widget with a Flexible widget

### Num 
- num.toStringWithLimitedDecimals(maxDecimals) => Returns a String with maxDecimals decimals, removing trailing zeros

### Num list/iterable
- sum() => Returns the sum of all elements
- avg({ifEmpty}) => Returns the average of all elements or ifEmpty value if empty
- max({ifEmpty}) => Returns the maximum value or ifEmpty value if empty
- min({ifEmpty}) => Returns the minimum value or ifEmpty value if empty
- range({ifEmpty}) => Returns the range (max - min) or ifEmpty value if empty
- median({ifEmpty}) => Returns the median value or ifEmpty value if empty
- product({ifEmpty}) => Returns the product of all elements or ifEmpty value if empty

```dart
final list = [1,2,3];
final sum = list.sum(); // 6
final avg = list.avg(); // 2
final max = list.max(); // 3
```

### Misc
- Object?.let(T Function(Object)) => Kotlin-styled let, to handle null values more easily
```dart
final String? a = "asd";

final int? length1 = a.let((it) => it.length);
// Is equivalent to
int? length2;
if(a != null) {
    length2 = a!.length
}
```