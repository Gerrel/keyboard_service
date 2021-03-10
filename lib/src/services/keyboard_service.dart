import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A service class that provides methods
/// to detect keyboard visisbility and the
/// dismissal of the keyboard.
abstract class KeyboardService {
  KeyboardService._();

  /// Returns a boolean value that indicates
  /// if the keyboard is currently is visible or not.
  static bool isVisible(BuildContext context) {
    var myContext =
        context.findRootAncestorStateOfType<ScaffoldState>()?.context;
    myContext ??= context;
    var keyboardVisisble = false;
    if (MediaQuery.of(myContext).viewInsets.bottom > 0) {
      keyboardVisisble = true;
    }
    return keyboardVisisble;
  }

  /// Will dismiss the keyboard if it is currently visible
  /// The optional parameter `unfocus` will also unfocus
  /// the input field in the BuildContext widget tree.
  static void dismiss({BuildContext? unfocus}) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (unfocus != null) {
      FocusScope.of(unfocus).unfocus();
    }
  }
}
