import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:clinic_finder/features/clinic/UI/clinicslist/yelp_service.dart';
import 'package:flutter/material.dart';
import 'package:clinic_finder/common/utils/colors.dart' as constants;
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clinic_finder/common/navigation/router/routes.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class ClinicsListPage extends StatefulWidget {
  const ClinicsListPage({super.key});

  @override
  ClinicsListPageState createState() => ClinicsListPageState();
}

class ClinicsListPageState extends State<ClinicsListPage> {
  LatLng? _userLocation;
  List<Marker> _markers = []; // Initialize an empty markers list

  String clinicName = '';
  String phoneNumber = '';
  String address = '';
  String hours = '';

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

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> _loadClinicData() async {
    final location = _userLocation != null ? _userLocation.toString() : '';
    var hospitalData = [];
    try {
      final hospitalList = await fetchHospitalData(location);
      print('API Response: $hospitalList');
      hospitalData = hospitalList;
    } catch (e) {
      print('Error: $e');
    }

    // Retrieves the first clinic in the json file
    setState(() {
      if (hospitalData.isNotEmpty) {
        // 0 is name, 1 is address, 2 is phone number, 3 is hours
        clinicName = hospitalData[0][0];
        address = hospitalData[0][1];
        phoneNumber = hospitalData[0][2];
        hours = hospitalData[0][3];
      } else {
        clinicName = "Error";
        address = "Error";
        phoneNumber = "Error";
        hours = "Error";
      }
    });

    _addMarkers(hospitalData); // Call to add markers after loading data
  }

Future<void> _addMarkers(List<dynamic> hospitalData) async {
  if (_userLocation != null) {
    setState(() {
      _markers = hospitalData.map((hospital) {
        final latitude = double.tryParse(hospital[4].toString()) ?? 0.0;
        final longitude = double.tryParse(hospital[5].toString()) ?? 0.0;

        return Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(latitude, longitude),
          builder: (ctx) => GestureDetector(
            onTap: () {
              _map(); // Define what happens on tap
            },
            child: Icon(
              Icons.location_pin, // Display a pin icon
              color: Colors.red,
              size: 40.0,
            ),
          ),
        );
      }).toList();
    });
  }
}

  @override
  void initState() {
    super.initState();
    _getUserLocation().then((_) {
      if (_userLocation != null) {
        _loadClinicData();
      }
    });
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
      body: _userLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: FlutterMap(
                options: MapOptions(
                  center: _userLocation!,
                  zoom: 11,
                ),
                children: [
                  openStreetMapTileLayer,
                  MarkerLayer(markers: _markers),
                ],
              ),
            ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.yourcompany.clinic_finder',
    );



