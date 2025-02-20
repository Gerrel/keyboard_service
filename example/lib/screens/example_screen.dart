import 'package:flutter/material.dart';
import 'package:keyboard_service/keyboard_service.dart';

/// The example screen which uses KeyboardAutoDismiss
/// and KeyboardService for demonstration.
class ExampleScreen extends StatefulWidget {
  /// Simple widget with input field and button
  /// to dismiss the keyboard.
  const ExampleScreen({
    Key? key,
  }) : super(key: key);

  @override
  ExampleScreenState createState() => ExampleScreenState();
}

/// State for ExampleScreen
class ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    final visible = KeyboardService.isVisible(context);
    return KeyboardAutoDismiss(
      scaffold: Scaffold(
        appBar: AppBar(
          title: const Text('Keyboard Service Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input field',
                ),
              ),
              const TextButton(
                onPressed: KeyboardService.dismiss,
                child: Text(
                  'Dismiss keyboard',
                ),
              ),
              TextButton(
                onPressed: () {
                  KeyboardService.dismiss(unfocus: context);
                },
                child: const Text(
                  'Dismiss and unfocus keyboard',
                ),
              ),
              Text('Keyboard is visible $visible'),
            ],
          ),
        ),
      ),
    );
  }
}
