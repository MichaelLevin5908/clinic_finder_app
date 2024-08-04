import 'package:amplify_flutter/amplify.dart';
import 'package:clinic_finder_app/screens/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:clinic_finder_app/amplifyconfiguration.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _configureAmplify();

  runApp(const MyApp());
}

Future<void> _configureAmplify() async {
  final auth = AmplifyAuthCognito();
  await Amplify.addPlugin(auth);

  try {
    await Amplify.configure(amplifyconfig);
    if (kDebugMode) {
      print('Successfully configured Amplify');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Could not configure Amplify: $e');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SignIn Example',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const SignInPage1
      (),
    );
  }
}