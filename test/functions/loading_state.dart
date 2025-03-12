import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micru_fl_utils/functions/loading_state.dart';

class _TestWidget extends StatefulWidget {
  const _TestWidget();

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> with LoadingStateMixin {
  @override
  Widget build(BuildContext context) => const SizedBox();
}

class TestLoadingState {
  static void run() {
    group('LoadingStateMixin', () {
      late _TestWidgetState state;

      setUp(() {
        state = _TestWidgetState();
      });

      test('withLoading handles single function execution', () async {
        var executed = false;
        final function = () async {
          executed = true;
        };

        expect(state.getLoadingState(function).value, false);
        await state.withLoading(function);
        expect(executed, true);
        expect(state.getLoadingState(function).value, false);
      });

      test('withLoading prevents concurrent execution', () async {
        var executionCount = 0;
        final function = () async {
          await Future.delayed(const Duration(milliseconds: 100));
          executionCount++;
        };

        // Start two concurrent executions
        final future1 = state.withLoading(function);
        final future2 = state.withLoading(function);

        await Future.wait([future1, future2]);
        expect(executionCount, 1);
      });

      test('withGlobalLoading prevents other functions from executing',
          () async {
        var executed1 = false;
        var executed2 = false;

        function1() async {
          await Future.delayed(const Duration(milliseconds: 100));
          executed1 = true;
        }

        function2() async {
          executed2 = true;
        }

        // Start global loading function and try to execute another
        final future1 = state.withGlobalLoading(function1);
        final future2 = state.withGlobalLoading(function2);

        await Future.wait([future1, future2]);
        expect(executed1, true);
        expect(executed2, false);
      });

      test('isAnyLoading returns correct state', () async {
        function() async {
          await Future.delayed(const Duration(milliseconds: 100));
        }

        expect(state.isAnyLoading(), false);

        final future = state.withLoading(function);
        expect(state.isAnyLoading(), true);

        await future;
        expect(state.isAnyLoading(), false);
      });
    });
  }
}
