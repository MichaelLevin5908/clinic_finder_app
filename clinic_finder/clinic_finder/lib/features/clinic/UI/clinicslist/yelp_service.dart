import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String getCurrentDay() {
  final now = DateTime.now();
  final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  return days[now.weekday - 1];
}

Future<List<List<String>>> fetchHospitalData(String location) async {
  await dotenv.load(fileName: ".env");

  final apiKey = dotenv.env['API_KEY'];
  const url = "api.yelp.com";
  const path = "/v3/businesses/search";

  final headers = {
    "Authorization": "Bearer $apiKey",
    "accept": "application/json"
  };

  final params = {
    "location": location,
    "term": "Hospital",
    "radius": "1000",
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
      var name = business['name'];
      var address = business['location']['address1'];
      var phone = business['phone'];
      var hours = business['hours']?.firstWhere((hour) => hour['day'] == currentDay,
      orElse: () => null,)?['hours'];

      name ??=    "Error";
      address ??= "Error";
      phone ??=   "Error";
      hours ??=   "Error";
      
      hospitalData.add([name, address, phone, hours]);
    }

    return hospitalData;
  } else {
    throw Exception("Failed to retrieve data. Status code: ${response.statusCode}");
  }
}

