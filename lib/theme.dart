import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Map<int, Color> primarySwatch = {
    50: Color(0xfffbebff),
    100: Color(0xfdf4c8ff),
    200: Color(0xfce78bFF),
    300: Color(0xfad44eFF),
    400: Color(0xf9c126FF),
    500: Color(0xf2a00eFF),
    600: Color(0xd77a08FF),
    700: Color(0xb2550bFF),
    800: Color(0x91420fFF),
    900: Color(0x773610FF),
  };

  static const Map<int, Color> secondarySwatch = {
    50: Color(0xf8fafcff),
    100: Color(0xf1f5f9ff),
    200: Color(0xe2e8f0ff),
    300: Color(0xcbd5e1FF),
    400: Color(0xa3b0c2FF),
    500: Color(0x64748bFF),
    600: Color(0x475569FF),
    700: Color(0x334155FF),
    800: Color(0x1e293bFF),
    900: Color(0x0f172aFF),
  };

  static const MaterialColor primaryColor =
      MaterialColor(0x773610FF, primarySwatch);

  static const MaterialColor secondaryColor =
      MaterialColor(0x773610FF, secondarySwatch);

  static const MaterialColor accentColor =
      MaterialColor(0x773610FF, secondarySwatch);

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
      fontFamily: fontFamily, fontSize: fontSize1, color: accentColor);
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
      primarySwatch: primarySwatch ?? primaryColor,
    );
  }
}

class CustomThemeData extends ThemeExtension<CustomThemeData> {
  const CustomThemeData(
      {required this.primaryMaterialColor,
      required this.secondaryMaterialColor,
      required this.color});

  final Color color;
  final MaterialColor primaryMaterialColor;
  final MaterialColor secondaryMaterialColor;

  @override
  ThemeExtension<CustomThemeData> copyWith(
      {MaterialColor? primaryMaterialColor,
      MaterialColor? secondaryMaterialColor,
      Color? color}) {
    return CustomThemeData(
      primaryMaterialColor: primaryMaterialColor ?? this.primaryMaterialColor,
      secondaryMaterialColor:
          secondaryMaterialColor ?? this.secondaryMaterialColor,
      color: color ?? this.color,
    );
  }

  MaterialColor _mapAndLerp(
      MaterialColor before, MaterialColor after, double t) {
    return MaterialColor(
      after.value,
      <int, Color>{
        50: Color.lerp(before.shade50, after.shade50, t)!,
        100: Color.lerp(before.shade100, after.shade100, t)!,
        200: Color.lerp(before.shade200, after.shade200, t)!,
        300: Color.lerp(before.shade300, after.shade300, t)!,
        400: Color.lerp(before.shade400, after.shade400, t)!,
        500: Color.lerp(before.shade500, after.shade500, t)!,
        600: Color.lerp(before.shade600, after.shade600, t)!,
        700: Color.lerp(before.shade700, after.shade700, t)!,
        800: Color.lerp(before.shade800, after.shade800, t)!,
        900: Color.lerp(before.shade900, after.shade900, t)!,
      },
    );
  }

  @override
  ThemeExtension<CustomThemeData> lerp(
      covariant ThemeExtension<CustomThemeData>? other, double t) {
    if (other is! CustomThemeData) {
      return this;
    }

    return CustomThemeData(
        primaryMaterialColor:
            _mapAndLerp(primaryMaterialColor, other.primaryMaterialColor, t),
        secondaryMaterialColor: _mapAndLerp(
            secondaryMaterialColor, other.secondaryMaterialColor, t),
        color: Color.lerp(color, other.color, t)!);
  }

  static createExtension(
      {MaterialColor? primaryMaterialColor,
      MaterialColor? secondaryMaterialColor,
      Color? color}) {
    return CustomThemeData(
      primaryMaterialColor: primaryMaterialColor ?? AppTheme.primaryColor,
      secondaryMaterialColor: secondaryMaterialColor ?? AppTheme.secondaryColor,
      color: color ?? Colors.blue,
    );
  }
}
