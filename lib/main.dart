import 'package:flutter/material.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:poc_json_theme/page/main_page.dart';
import 'package:poc_json_theme/services/theme_service.dart';
import 'package:poc_json_theme/theme.dart';
import 'package:provider/provider.dart';

ThemeData theme = AppTheme.createTheme();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SchemaValidator.enabled = false;
  runApp(
    ChangeNotifierProvider<ThemeService>(
      create: (_) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeService.theme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
