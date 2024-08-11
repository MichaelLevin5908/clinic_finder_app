import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

class SignInPage1 extends StatelessWidget {
  const SignInPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Authenticator(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/chospital.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                    colorBlendMode: BlendMode.modulate
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Welcome to Clinic Finder!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Enter your email and password to continue.",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const SignInForm(),
                  const SizedBox(height: 16),
                  const CreateAccountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EmailField(),
        SizedBox(height: 16),
        PasswordField(),
        SizedBox(height: 16),
        RememberMeCheckbox(),
        SizedBox(height: 16),
        SignInButton(),
      ],
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: Icon(Icons.lock_outline_rounded),
        border: OutlineInputBorder(),
      ),
    );
  }
}

class RememberMeCheckbox extends StatefulWidget {
  const RememberMeCheckbox({super.key});

  @override
  _RememberMeCheckboxState createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _rememberMe,
      onChanged: (value) {
        setState(() {
          _rememberMe = value ?? false;
        });
      },
      title: const Text('Remember me'),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      contentPadding: const EdgeInsets.all(0),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: () {
          // Sign in logic can go here if needed
        },
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Sign in',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
      },
      child: const Text(
        "Don't have an account? Create one",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}




