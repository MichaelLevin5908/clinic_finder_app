import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:clinic_finder/common/utils/colors.dart' as constants;
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clinic_finder/common/navigation/router/routes.dart';
import 'package:latlong2/latlong.dart';  

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

  Future<void> _map() async {
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
            icon: const Icon(Icons.info, color: Colors.white),
            onPressed: _map, 
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

Widget content() {
  return FlutterMap(
    options: const MapOptions(
      initialCenter: LatLng(34.0522, -118.2437),
      initialZoom: 11,
      interactionOptions: InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
    ),
    children: [
      openStreetMapTileLayer,
      //MarkerLayer(markers: markers)
    ],
  );
}

TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);


