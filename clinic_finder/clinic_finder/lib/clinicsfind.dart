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
      // Customize the UI for authentication steps
      authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return CustomScaffold(
              state: state,
              body: SignInForm(), // Prebuilt Sign In form
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () => state.changeStep(AuthenticatorStep.signUp),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.signUp:
            return CustomScaffold(
              state: state,
              body: SignUpForm(), // Prebuilt Sign Up form
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => state.changeStep(AuthenticatorStep.signIn),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.confirmSignUp:
            return CustomScaffold(
              state: state,
              body: ConfirmSignUpForm(), // Prebuilt Confirm Sign Up form
            );
          case AuthenticatorStep.resetPassword:
            return CustomScaffold(
              state: state,
              body: ResetPasswordForm(), // Prebuilt Reset Password form
            );
          case AuthenticatorStep.confirmResetPassword:
            return CustomScaffold(
              state: state,
              body: const ConfirmResetPasswordForm(), // Prebuilt Confirm Reset Password form
            );
          default:
            return null; // Default to prebuilt UI for other steps
        }
      },
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

/// A custom scaffold widget that includes a welcome text at the top,
/// a logo, a body (form), and an optional footer.
class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.state,
    required this.body,
    this.footer,
  });

  final AuthenticatorState state;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Welcome text at the top
              const Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                  'Welcome to Clinic Finder',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Optional logo (if needed) - this can be removed if not needed
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Center(
                  child: Image.asset(
                    'images/chospital.png', 
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              // The main form content
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: body,
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: footer != null ? [footer!] : null,
    );
  }
}