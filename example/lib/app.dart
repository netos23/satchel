import 'package:flutter/material.dart';

import 'main_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final modeState = ValueNotifier<ThemeMode>(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: modeState,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Code flow',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: mode,
          home: Builder(
            builder: (context) {
              final theme = Theme.of(context);
              return MainPage(
                modeState: modeState,
                theme: theme,
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    modeState.dispose();
    super.dispose();
  }
}
