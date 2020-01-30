import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardService {
  static bool isVisible(BuildContext context) {
    assert(context != null);
    BuildContext myContext =
        context.findRootAncestorStateOfType<ScaffoldState>()?.context;
    if (myContext == null) {
      myContext = context;
    }
    bool keyboardVisisble = false;
    if (MediaQuery.of(myContext).viewInsets.bottom > 0) {
      keyboardVisisble = true;
    }
    return keyboardVisisble;
  }

  static dismiss() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
