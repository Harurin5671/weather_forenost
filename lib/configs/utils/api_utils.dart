import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:interview_flutter/configs/constants/constants.dart';

Future<List> searchCityForName(String value) async {
  List cities = [];
  try {
    if (value.isNotEmpty) {
      const apikey = Constants.apiKey;
      Uri url = Uri.parse(
          'http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=$apikey&q=$value');

      var response = await http.get(url);

      if (response.body != 'null' &&
          response.body.isNotEmpty &&
          response.statusCode == 200) {
        cities = json.decode(response.body);
      }
    }
  } catch (e) {
    print('Error fetching cities: $e'); // ignore: avoid_print
  }
  return cities;
}

Future<Map<String, dynamic>?> getTimeOfCity(String cityKey) async {
  try {
    const apikey = Constants.apiKey;
    Uri url = Uri.parse(
        'http://dataservice.accuweather.com/currentconditions/v1/$cityKey?apikey=$apikey');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List cityInfo = json.decode(response.body);
      return {
        'temperature': cityInfo[0]['Temperature']['Metric']['Value'],
        'date': cityInfo[0]['LocalObservationDateTime'],
      };
    }
  } catch (e) {
    print('Error fetching city time: $e'); // ignore: avoid_print
  }
  return null;
}
