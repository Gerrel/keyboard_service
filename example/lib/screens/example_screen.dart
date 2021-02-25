import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_service/keyboard_service.dart';

/// The example screen which uses KeyboardAutoDismiss
/// and KeyboardService for demonstration.
class ExampleScreen extends StatefulWidget {
  /// Simple widget with input field and button
  /// to dismiss the keyboard.
  ExampleScreen({
    Key key,
  }) : super(key: key);

  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    final visible = KeyboardService.isVisible(context);
    return KeyboardAutoDismiss(
        scaffold: Scaffold(
      appBar: AppBar(
        title: Text('Keyboard Service Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input field',
              ),
            ),
            TextButton(
              onPressed: () {
                KeyboardService.dismiss();
              },
              child: Text(
                "Dismiss keyboard",
              ),
            ),
            Text("Keyboard is visible ${visible}")
          ],
        ),
      ),
    ));
  }
}
