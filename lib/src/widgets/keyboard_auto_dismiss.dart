import 'package:flutter/material.dart';

import '../services/keyboard_service.dart';

class KeyboardAutoDismiss extends StatelessWidget {
  final Scaffold scaffold;
  const KeyboardAutoDismiss({@required this.scaffold});

  @override
  Widget build(BuildContext context) {
    assert(context.findAncestorWidgetOfExactType<KeyboardAutoDismiss>() == null,
        'Can only have 1 KeyboardAutoDismiss in the widget tree.');
    return GestureDetector(
        onTap: () {
          KeyboardService.dismiss();
        },
        child: scaffold);
  }
}
