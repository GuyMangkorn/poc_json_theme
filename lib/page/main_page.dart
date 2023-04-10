import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:poc_json_theme/services/theme_service.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _initTheme() async {
    final themeStr =
        await rootBundle.loadString('assets/json/first_theme.json');
    final themeJson = json.decode(themeStr);
    final brandColor = ThemeDecoder.decodeMaterialColor(
      themeJson['color']['grayColor'],
    );
    
    final theme = ThemeDecoder.decodeThemeData(
          themeJson['theme'],
          validate: true,
        ) ??
        ThemeData.light();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final themeService = context.read<ThemeService>();
      themeService.setTheme(theme);
      themeService.setMaterialColor(materialColor: brandColor);
    });
  }

  @override
  void initState() {
    _initTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Consumer<ThemeService>(
              builder: (context, value, child) {
                return Container(
                  color: value.neutralColor.shade100,
                  height: 200,
                  width: 200,
                  child: child,
                );
              },
              child: const Center(child: Text('Guy')),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
