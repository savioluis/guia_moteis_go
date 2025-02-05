import 'package:flutter/material.dart';
import 'package:guia_moteis_go/core/theme/app_theme.dart';
import 'package:guia_moteis_go/src/features/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia Moteis Go',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.lightTheme(),
      themeMode: ThemeMode.system,
    );
  }
}