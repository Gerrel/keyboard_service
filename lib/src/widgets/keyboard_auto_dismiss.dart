import 'package:flutter/material.dart';
import 'package:keyboard_service/keyboard_service.dart';

/// There can be only KeyboardAutoDismiss widget in the tree
/// Select [always] when it is the root scaffold
/// Select [whenNeeded] when you use the scaffold also as a root widget
/// Select [never] when you want to disable auto-dismiss
enum KeyboardDismiss {
  /// Always activate auto-dismiss and throw
  /// assertion error if there already is a KeyboardAutoDismiss ancestor
  always,

  /// Only activates when there is no ancestor KeyboardAutoDismiss widget
  whenNeeded,

  /// Does not activate auto-dismiss
  never,
}

/// A widget that wraps the Scaffold widget
/// It will catch clicks and presses outside of
/// UI input component and will dismiss the keyboard automatically.
class KeyboardAutoDismiss extends StatelessWidget {
  final Scaffold _scaffold;
  final KeyboardDismiss _dismiss;

  /// The parameter `scaffold` is a widget of the type Scaffold.
  const KeyboardAutoDismiss({
    Key? key,
    required Scaffold scaffold,
    KeyboardDismiss dismiss = KeyboardDismiss.always,
  })  : _scaffold = scaffold,
        _dismiss = dismiss,
        super(key: key);

  /// Get KeyboardAutoDismiss in the ancestor widget tree
  static KeyboardAutoDismiss? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<KeyboardAutoDismiss>();
  }

  /// Wrap the scaffold if there is no KeyboardAutoDimiss already
  static Widget wrapIfNeeded(
    BuildContext context, {
    required Scaffold scaffold,
  }) {
    if (KeyboardAutoDismiss.of(context) == null) {
      return KeyboardAutoDismiss(scaffold: scaffold);
    }
    return scaffold;
  }

  @override
  Widget build(BuildContext context) {
    if (_dismiss == KeyboardDismiss.always) {
      assert(KeyboardAutoDismiss.of(context) == null,
          'Can only have 1 KeyboardAutoDismiss in the widget tree.');
      return GestureDetector(
        onTap: () {
          KeyboardService.dismiss(unfocus: context);
        },
        child: _scaffold,
      );
    } else if (_dismiss == KeyboardDismiss.whenNeeded) {
      if (KeyboardAutoDismiss.of(context) == null) {
        return GestureDetector(
          onTap: () {
            KeyboardService.dismiss(unfocus: context);
          },
          child: _scaffold,
        );
      } else {
        return _scaffold;
      }
    } else {
      return _scaffold;
    }
  }
}
