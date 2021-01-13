import 'package:flutter/material.dart';
import 'package:movie_app/ui/settings/theme/colorTheme.dart';

class ThemeProvider {
  ThemeData _themeData = lightTheme;

  ThemeData get getTheme => _themeData;

  void changeTheme() {
    if (_themeData == lightTheme) {
      _themeData = darkTheme;
    } else if (_themeData == darkTheme) {
      _themeData = lightTheme;
    }
  }
}
