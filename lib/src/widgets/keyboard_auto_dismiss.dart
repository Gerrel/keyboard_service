import 'package:flutter/material.dart';
import 'package:keyboard_service/keyboard_service.dart';

/// A widget that wraps the Scaffold widget
/// It will catch clicks and presses outside of
/// UI input component and will dismiss the keyboard automatically.
class KeyboardAutoDismiss extends StatelessWidget {
  final Scaffold _scaffold;

  /// The parameter `scaffold` is a widget of the type Scaffold.
  const KeyboardAutoDismiss({@required Scaffold scaffold})
      : _scaffold = scaffold;

  /// Get KeyboardAutoDismiss in the ancestor widget tree
  static KeyboardAutoDismiss of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<KeyboardAutoDismiss>();
  }

  /// Wrap the scaffold if there is no KeyboardAutoDimiss already
  static Widget wrapIfNeeded(BuildContext context, Scaffold scaffold) {
    if (KeyboardAutoDismiss.of(context) == null) {
      return KeyboardAutoDismiss(scaffold: scaffold);
    }
    return scaffold;
  }

  @override
  Widget build(BuildContext context) {
    assert(KeyboardAutoDismiss.of(context) == null,
        'Can only have 1 KeyboardAutoDismiss in the widget tree.');
    return GestureDetector(
      onTap: () {
        KeyboardService.dismiss(unfocus: context);
      },
      child: _scaffold,
    );
  }
}
