import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = ThemeData.light();
  ThemeData get theme => _theme;

  void toggleTheme() {
    final isLight = _theme == ThemeData.light();

    if (isLight) {
      _theme = ThemeData.dark();
    } else {
      _theme = ThemeData.light();
    }

    notifyListeners();
  }
}
