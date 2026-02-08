import 'package:cafe_cool/core/routes/app_routes.dart';
import 'package:cafe_cool/core/theme/app_theme.dart';
import 'package:cafe_cool/features/navigation/presentation/pages/main_navigation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeScriptApp());
}

class CoffeeScriptApp extends StatelessWidget {
  const CoffeeScriptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const MainNavigationScreen(),
      routes: AppRoutes.routes,
    );
  }
}
