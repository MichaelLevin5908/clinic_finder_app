import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<String>> fetchHospitalNames(String location) async {
  print("That is it");
  await dotenv.load(fileName: ".env");

  final apiKey = dotenv.env['API_KEY'];
  print(apiKey);
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
    final List<String> hospitalNames = [];

    for (var business in data['businesses']) {
      hospitalNames.add(business['name']);
    }

    return hospitalNames;
  } else {
    throw Exception("Failed to retrieve data. Status code: ${response.statusCode}");
  }
}

