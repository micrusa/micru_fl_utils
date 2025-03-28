import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micru_fl_utils/mixins/text_editing_controller.dart';

// Create a test widget that uses the TextEditingControllerMixin
class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget>
    with TextEditingControllerMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  group('TextEditingControllerMixin', () {
    testWidgets('textEditingController returns a controller for the given key',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: TestWidget()));

      final state = tester.state<_TestWidgetState>(find.byType(TestWidget));

      // Test getting a controller for a key
      final controller1 = state.textEditingController('key1');
      expect(controller1, isA<TextEditingController>());
      expect(controller1.text, isEmpty);

      // Test getting the same controller for the same key
      final controller2 = state.textEditingController('key1');
      expect(controller2, same(controller1));

      // Test getting a controller with initial text
      final controller3 =
          state.textEditingController('key2', text: 'initial text');
      expect(controller3.text, equals('initial text'));
    });

    testWidgets('initTextEditingControllers initializes controllers from a map',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: TestWidget()));

      final state = tester.state<_TestWidgetState>(find.byType(TestWidget));

      // Initialize controllers from a map
      state.initTextEditingControllers({
        'key1': 'value1',
        'key2': 'value2',
      });

      // Test if controllers were initialized correctly
      final controller1 = state.textEditingController('key1');
      expect(controller1.text, equals('value1'));

      final controller2 = state.textEditingController('key2');
      expect(controller2.text, equals('value2'));
    });
  });
}
