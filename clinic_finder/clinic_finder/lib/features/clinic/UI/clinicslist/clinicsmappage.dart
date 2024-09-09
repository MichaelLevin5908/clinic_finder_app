import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:clinic_finder/common/utils/colors.dart' as constants;
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clinic_finder/common/navigation/router/routes.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'yelp_service.dart';

class ClinicsMapPage extends StatefulWidget {
  const ClinicsMapPage({super.key});

  @override
  ClinicsMapState createState() => ClinicsMapState();
}

class ClinicsMapState extends State<ClinicsMapPage> {

  String clinicName =   '';
  String phoneNumber =  '';
  String address =      '';
  String hours =        '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _signOut() async {
    await Amplify.Auth.signOut();
    if (!mounted) {
      return;
    }
    context.goNamed(AppRoute.signin.name);
  }

  Future<void> _clinicsList() async {
    if (!mounted) {
      return;
    }
    context.goNamed(AppRoute.home.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Information Screen',
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
            onPressed: _clinicsList, 
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightBlue[700],
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Clinic Name: $clinicName',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Phone Number: $phoneNumber',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Address: $address',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Hours: $hours',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}