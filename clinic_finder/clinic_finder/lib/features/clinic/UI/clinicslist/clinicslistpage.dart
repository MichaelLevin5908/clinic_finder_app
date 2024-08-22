import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clinic_finder/common/utils/colors.dart' as constants;
import 'package:clinic_finder/common/navigation/router/routes.dart';

import 'package:amplify_flutter/amplify_flutter.dart';

class ClinicsListPage extends StatelessWidget {
  const ClinicsListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Clinics Screen',
        ),
        backgroundColor: const Color(constants.primaryColorDark),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            await Amplify.Auth.signOut();  // Sign out the user
            context.goNamed(AppRoute.home.name); // Navigate back to the sign-in screen
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(constants.primaryColorDark),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Clinics List'),
      ),
    );
  }
}
