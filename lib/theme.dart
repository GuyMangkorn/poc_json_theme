import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Map<int, Color> brandSwatch = {
    50: Color(0xFFfffbeb),
    100: Color(0xFFfdf4c8),
    200: Color(0xFFfce78b),
    300: Color(0xFFfad44e),
    400: Color(0xFFf9c126),
    500: Color(0xFFf2a00e),
    600: Color(0xFFd77a08),
    700: Color(0xFFb2550b),
    800: Color(0xFF91420f),
    900: Color(0xFF773610),
  };

  static const MaterialColor _brandColor =
      MaterialColor(0xFF773610, brandSwatch);

  static const fontFamily = 'Kanit';

  static const double fontSize1 = 44;
  static const double fontSize2 = 40;
  static const double fontSize3 = 36;
  static const double fontSize4 = 32;
  static const double fontSize5 = 28;
  static const double fontSize6 = 24;
  static const double fontSize7 = 22;
  static const double fontSize8 = 16;
  static const double fontSize9 = 14;
  static const double fontSize10 = 12;
  static const double fontSize11 = 11;

  static const _displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize1,
  );
  static final _displayMedium = _displayLarge.copyWith(fontSize: fontSize2);
  static final _displaySmall = _displayLarge.copyWith(fontSize: fontSize3);

  static const _headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize4,
  );
  static final _headlineMedium = _headlineLarge.copyWith(fontSize: fontSize5);
  static final _headlineSmall = _headlineLarge.copyWith(fontSize: fontSize6);

  static const _titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: fontSize7,
  );
  static final _titleMedium = _titleLarge.copyWith(fontSize: fontSize8);
  static final _titleSmall = _titleLarge.copyWith(fontSize: fontSize9);

  static const _bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize8,
  );
  static final _bodyMedium = _bodyLarge.copyWith(fontSize: fontSize9);
  static final _bodySmall = _bodyLarge.copyWith(fontSize: fontSize10);

  static const _labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize9,
  );
  static final _labelMedium = _labelLarge.copyWith(fontSize: fontSize10);
  static final _labelSmall = _labelLarge.copyWith(fontSize: fontSize11);

  static final TextTheme _textTheme = TextTheme(
    displayLarge: _displayLarge,
    displayMedium: _displayMedium,
    displaySmall: _displaySmall,
    headlineLarge: _headlineLarge,
    headlineMedium: _headlineMedium,
    headlineSmall: _headlineSmall,
    titleLarge: _titleLarge,
    titleMedium: _titleMedium,
    titleSmall: _titleSmall,
    bodyLarge: _bodyLarge,
    bodyMedium: _bodyMedium,
    bodySmall: _bodySmall,
    labelLarge: _labelLarge,
    labelMedium: _labelMedium,
    labelSmall: _labelSmall,
  );

  static createTheme({
    MaterialColor? primarySwatch,
  }) {
    return ThemeData(
      textTheme: _textTheme,
      primarySwatch: primarySwatch ?? _brandColor,
    );
  }
}
