import 'package:flutter/material.dart';
import 'package:poc_json_theme/theme.dart';

class ThemeService with ChangeNotifier {
  ThemeService();

  ThemeData _themeData = AppTheme.createTheme();

  get theme => _themeData;

  setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  setPrimarySwatch({MaterialColor? primarySwatch}) {
    _themeData = AppTheme.createTheme(primarySwatch: primarySwatch);
    notifyListeners();
  }
}
