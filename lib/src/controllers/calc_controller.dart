import 'package:calculadora/src/widgets/button_hub.dart';
import 'package:flutter/foundation.dart';
import 'package:function_tree/function_tree.dart';

class CalcController extends ChangeNotifier {
  var display = '0';

  void onButtonClick(ButtonClick click) {
    if (display == '0') {
      display = '';
    }

    if (click is CommonButtonClick) {
      display += click.value;
    } else if (click is ClearButtonClick || click is ClearEntryButtonClick) {
      display = '0';
    } else if (click is EqualsButtonClick) {
      try {
        final v = display.interpret();
        display = '$v';
      } catch (e) {
        display = '0';
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    }

    notifyListeners();
  }
}
