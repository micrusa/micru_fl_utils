import 'package:flutter_test/flutter_test.dart';
import 'package:micru_fl_utils/functions/loading_state.dart';

import 'functions/loading_state.dart';
import 'numbers/num_extensions.dart';
import 'numbers/num_iterable_extensions.dart';
import 'misc/let_extension.dart';

void main() {
  TestNumExtensions.run();
  TestLoadingState.run();
  TestNumIterableExtensions.run();
  TestLetExtension.run();
}
