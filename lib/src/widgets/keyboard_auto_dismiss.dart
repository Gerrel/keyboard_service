import 'package:flutter/material.dart';

import '../services/keyboard_service.dart';

/// A widget that wraps the Scaffold widget
/// It will catch clicks and presses outside of
/// UI input component and will dismiss the keyboard automatically.
class KeyboardAutoDismiss extends StatelessWidget {
  final Scaffold _scaffold;

  /// The parameter `scaffold` is a widget of the type Scaffold.
  const KeyboardAutoDismiss({@required Scaffold scaffold})
      : _scaffold = scaffold;

  @override
  Widget build(BuildContext context) {
    assert(context.findAncestorWidgetOfExactType<KeyboardAutoDismiss>() == null,
        'Can only have 1 KeyboardAutoDismiss in the widget tree.');
    return GestureDetector(
      onTap: () {
        KeyboardService.dismiss(unfocus: context);
      },
      child: _scaffold,
    );
  }
}
