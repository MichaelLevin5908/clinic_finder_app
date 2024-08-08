import 'package:flutter/material.dart';
import 'package:clinic_finder_app/router.dart';
import 'package:clinic_finder_app/themes/app_theme.dart';

class ClinicFinderApp extends StatelessWidget {
  const ClinicFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.lightTheme,
    );
  }
}



