import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String getCurrentDay() {
  final now = DateTime.now();
  final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  return days[now.weekday - 1];
}

Future<List<List<String>>> fetchHospitalData(double latitude, double longitude) async {
  await dotenv.load(fileName: ".env");

  final apiKey = dotenv.env['API_KEY'];
  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('API Key is missing');
  }

  const url = "api.yelp.com";
  const path = "/v3/businesses/search";

  final headers = {
    "Authorization": "Bearer $apiKey",
    "accept": "application/json"
  };

  // Convert latitude and longitude to strings
  final params = {
    "latitude": latitude.toString(),
    "longitude": longitude.toString(),
    "term": "Hospital",
    "radius": "1000",  // Radius in meters
    "sort_by": "best_match",
    "limit": "20"
  };

  final uri = Uri.https(url, path, params);
  final response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<List<String>> hospitalData = [];
    final currentDay = getCurrentDay();

    for (var business in data['businesses']) {
      var name = business['name'] ?? "Unknown";
      var address = business['location']['address1'] ?? "No address provided";
      var phone = business['phone'] ?? "No phone number";
      
      // Handle hours safely
      var hours = business['hours']?.firstWhere(
          (hour) => hour['day'] == currentDay, orElse: () => null)?['hours'] ?? "Not Available";

      var latitude = business['coordinates']['latitude'].toString();
      var longitude = business['coordinates']['longitude'].toString();

      hospitalData.add([name, address, phone, hours, latitude, longitude]);
    }

    return hospitalData;
  } else {
    print("Failed to retrieve data. Status code: ${response.statusCode}");
    throw Exception("Failed to retrieve data. Status code: ${response.statusCode}");
  }
}