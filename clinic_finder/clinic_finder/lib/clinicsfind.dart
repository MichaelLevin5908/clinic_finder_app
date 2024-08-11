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
          textTheme: GoogleFonts.latoTextTheme( 
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: constants.primaryColor,
          ).copyWith(
            secondary: Colors.tealAccent, 
            surface: const Color(0xff82CFEA), 
            onPrimary: Colors.white, 
            onSecondary: Colors.black, 
          ),
        ),
      ),
    );
  }
}




