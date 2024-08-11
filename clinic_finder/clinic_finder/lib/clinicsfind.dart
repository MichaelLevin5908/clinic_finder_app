import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:clinic_finder/common/navigation/router/router.dart';
import 'package:clinic_finder/common/utils/colors.dart' as constants;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClinicApp extends StatelessWidget {
  const ClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
        builder: Authenticator.builder(),
        theme: ThemeData(
          primaryColor: const Color(0xFF82CFEA),
          hintColor: Colors.black,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.black),
            hintStyle: TextStyle(color: Colors.grey),
          ),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF82CFEA),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF82CFEA),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF82CFEA),
            secondary: Colors.white,
            surface: const Color(0xFF82CFEA),
          ),
        ),
      ),
    );
  }
}






