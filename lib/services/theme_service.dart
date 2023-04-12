import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:poc_json_theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType {
  themeOne,
  themeTwo,
  themeThree,
}

class ThemeService with ChangeNotifier {
  ThemeType currentTheme = ThemeType.themeOne;
  ThemeData _themeData = AppTheme.createTheme();
  CustomThemeData _customThemeData = CustomThemeData.createExtension();

  ThemeData get theme => _themeData.copyWith(extensions: [_customThemeData]);
  CustomThemeData get customThemeData => _customThemeData;

  loadThemeFormNumber({required ThemeType key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString(key.name);
    if (theme != null) {
      final priSwatch = ThemeDecoder.decodeMaterialColor(json.decode(theme));
      _customThemeData = CustomThemeData.createExtension(
        primaryMaterialColor: priSwatch,
      );
      _themeData = _themeData.copyWith(extensions: [_customThemeData]);
      notifyListeners();
      return;
    }

    final themeRawJson =
        await rootBundle.loadString('assets/json/first_theme.json');
    MaterialColor? bckMaterialColor = AppTheme.secondaryColor;
    final themeJson = json.decode(themeRawJson);
    final Map<String, dynamic> selectedJson;
    switch (key) {
      case ThemeType.themeOne:
        selectedJson = themeJson['color']['grayColor'];
        bckMaterialColor = ThemeDecoder.decodeMaterialColor(selectedJson);
        break;
      case ThemeType.themeTwo:
        selectedJson = themeJson['color']['greenColor'];
        bckMaterialColor = ThemeDecoder.decodeMaterialColor(selectedJson);
        break;
      case ThemeType.themeThree:
        selectedJson = themeJson['color']['redColor'];
        bckMaterialColor = ThemeDecoder.decodeMaterialColor(selectedJson);
        break;
    }
    _customThemeData = CustomThemeData.createExtension(
      primaryMaterialColor: bckMaterialColor,
    );
    _themeData = _themeData.copyWith(extensions: [_customThemeData]);
    final encodeJson = json.encode(selectedJson);
    await prefs.setString(key.name, encodeJson);
    notifyListeners();
  }

  setExtensions({
    MaterialColor? primaryMaterialColor,
    MaterialColor? secondaryMaterialColor,
  }) {
    _customThemeData = CustomThemeData.createExtension(
      primaryMaterialColor: primaryMaterialColor,
      secondaryMaterialColor: secondaryMaterialColor,
    );
    notifyListeners();
  }

  setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  setPrimarySwatch({MaterialColor? primarySwatch}) {
    _themeData = AppTheme.createTheme(primarySwatch: primarySwatch);
    notifyListeners();
  }
}
