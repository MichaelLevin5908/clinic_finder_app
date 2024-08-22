import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:clinic_finder/common/utils/colors.dart' as constants;
import 'package:go_router/go_router.dart';
import 'package:clinic_finder/common/navigation/router/routes.dart';

class ClinicsListPage extends StatefulWidget {
  const ClinicsListPage({super.key});

  @override
  ClinicsListPageState createState() => ClinicsListPageState();
}

class ClinicsListPageState extends State<ClinicsListPage> {
  Future<void> _signOut() async {
    await Amplify.Auth.signOut(); 
    if (!mounted) 
    {
      return;
    }
    context.goNamed(AppRoute.signin.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Clinics Screen'),
        backgroundColor: const Color(constants.primaryColorDark),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _signOut,
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

