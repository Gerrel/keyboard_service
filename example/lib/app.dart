import 'package:flutter/material.dart';
import 'package:keyboard_service_example/screens/example_screen.dart';

/// The example app widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExampleScreen(),
    );
  }
}
