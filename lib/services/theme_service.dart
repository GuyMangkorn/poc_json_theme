import 'package:flutter/material.dart';
import 'package:poc_json_theme/theme.dart';

class ThemeService with ChangeNotifier {
  MaterialColor _neutralColor = AppTheme.brandColor;

  ThemeData _themeData = AppTheme.createTheme();

  ThemeData get theme => _themeData;
  MaterialColor get neutralColor => _neutralColor;

  setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  setMaterialColor({MaterialColor? materialColor}) {
    _neutralColor = materialColor ?? AppTheme.brandColor;
    notifyListeners();
  }

  setPrimarySwatch({MaterialColor? primarySwatch}) {
    _themeData = AppTheme.createTheme(primarySwatch: primarySwatch);
    notifyListeners();
  }
}
