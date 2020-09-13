import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardService {
  static bool isVisible(BuildContext context) {
    assert(context != null);
    var myContext =
        context.findRootAncestorStateOfType<ScaffoldState>()?.context;
    myContext ??= context;
    var keyboardVisisble = false;
    if (MediaQuery.of(myContext).viewInsets.bottom > 0) {
      keyboardVisisble = true;
    }
    return keyboardVisisble;
  }

  static void dismiss({BuildContext unfocus}) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (unfocus != null) {
      FocusScope.of(unfocus).unfocus();
    }
  }
}
