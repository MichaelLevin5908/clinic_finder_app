import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:clinic_finder_app/router.dart';
import 'package:clinic_finder_app/themes/app_theme.dart';

class ClinicFinderApp extends StatelessWidget {
  const ClinicFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
        builder: Authenticator.builder(),
        theme: AppTheme.lightTheme,  // Apply the custom light theme
      ),
    );
  }
}



