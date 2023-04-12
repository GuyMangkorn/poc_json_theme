import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:poc_json_theme/services/theme_service.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _initTheme() async {
    final themeStr =
        await rootBundle.loadString('assets/json/first_theme.json');
    final themeJson = json.decode(themeStr);
    // final brandColor = ThemeDecoder.decodeMaterialColor(
    //   themeJson['color']['grayColor'],
    // );

    final theme = ThemeDecoder.decodeThemeData(
          themeJson['theme'],
          validate: true,
        ) ??
        ThemeData.light();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final themeService = context.read<ThemeService>();
      // themeService.setTheme(theme);
    });
  }

  @override
  void initState() {
    _initTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomThemeData>()!;
    final themeService = context.read<ThemeService>();
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    themeService.loadThemeFormNumber(key: ThemeType.themeOne);
                  },
                  child: const Text('Theme one'),
                ),
                ElevatedButton(
                  onPressed: () {
                    themeService.loadThemeFormNumber(key: ThemeType.themeTwo);
                  },
                  child: const Text('Theme two'),
                ),
                ElevatedButton(
                  onPressed: () {
                    themeService.loadThemeFormNumber(key: ThemeType.themeThree);
                  },
                  child: const Text('Theme three'),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade50,
              child: const Text('Shade50_'),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade100,
              child: const Text('Shade100'),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade200,
              child: const Text('Shade200'),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade300,
              child: const Text('Shade300'),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade400,
              child: const Text('Shade400'),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade500,
              child: const Text('Shade500'),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade600,
              child: const Text('Shade600'),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade700,
              child: const Text('Shade700'),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade800,
              child: const Text('Shade800'),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              color: customTheme.primaryMaterialColor.shade900,
              child: const Text('Shade900'),
            ),
          ],
        ),
      ),
    );
  }
}
