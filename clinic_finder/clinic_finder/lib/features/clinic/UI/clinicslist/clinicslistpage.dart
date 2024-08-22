import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:clinic_finder/common/utils/colors.dart' as constants;
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clinic_finder/common/navigation/router/routes.dart';  

class ClinicsListPage extends StatefulWidget {
  const ClinicsListPage({super.key});

  @override
  ClinicsListPageState createState() => ClinicsListPageState();
}

class ClinicsListPageState extends State<ClinicsListPage> {
  Future<void> _signOut() async {
    await Amplify.Auth.signOut();
    if (!mounted) {
      return;
    }
    context.goNamed(AppRoute.signin.name);
  }

  Future<void> _Map() async {
    if (!mounted) {
      return;
    }
    context.goNamed(AppRoute.map.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Clinics Screen',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.lightBlue[700],
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: _signOut,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.map, color: Colors.white),
            onPressed: _Map, 
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightBlue[700],
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Center(
        child: Text(
          'Clinics List',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.lightBlue,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}


