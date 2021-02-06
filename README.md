# keyboard_service

Keyboard visibility / (auto-) dismiss package without native plugin

[![Watch on GitHub][github-watch-badge]][github-watch]
[![Star on GitHub][github-star-badge]][github-star]
[![pub package](https://img.shields.io/pub/v/keyboard_service.svg)](https://pub.dev/packages/keyboard_service)

## Getting Started

Use it for example when you want to automatically dimiss the on-screen keyboard when tapped outside of textfield.
And if you want know if the on-screen keyboard is visible and/or want to explicitly dismiss it.

There are 2 classes 
- 'KeyboardService': Check if keyboard is visible and dismiss keyboard.
- 'KeyboardAutoDismiss': A widget that wraps a Scaffold widget for automatically dismissing the keyboard.

`Also see example project`

Wrap your top scaffold:
```dart
return KeyboardAutoDismiss(
        scaffold: Scaffold(
            appBar: AppBar(
                title: Text('Keyboard Service Example'),
            ),
      ...
        ),
    );
```

Use the service class if needed:
```dart
// Use method below to dismiss the keyboard
KeyboardService.dismiss();

// Use the optional BuildContext parameter to remove focus of a TextField
KeyboardService.dismiss(unfocus: context);

// Check if the keyboard is visible
KeyboardService.isVisible(context);

```

## License

This project is licensed under the MIT License - see the 
[license] file for details.

[license]: https://github.com/Gerrel/keyboard_service/blob/master/LICENSE.md
[github-watch-badge]: https://img.shields.io/github/watchers/Gerrel/keyboard_service.svg?style=social
[github-watch]: https://github.com/Gerrel/keyboard_service/watchers
[github-star-badge]: https://img.shields.io/github/stars/Gerrel/keyboard_service.svg?style=social
[github-star]: https://github.com/Gerrel/keyboard_service/stargazers
[releases]: https://github.com/Gerrel/keyboard_service/releases
