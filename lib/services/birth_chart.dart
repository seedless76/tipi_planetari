import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dominanti_planetarie/constants.dart';

class BirthChart {
  BirthChart({@required this.latitude, @required this.longitude, @required this.birthDate, @required this.birthTime});

  final String latitude;
  final String longitude;
  final String birthDate;
  final String birthTime;
  var birthChartData;
  // var birthChartHouses;

  Future<dynamic> getBirthChart() async {
    final http.Response response = await http.post(
      '$kImmanuelURL',
      body: {
        'api_key': '$kImmanuelApiKey',
        'api_secret': '$kImmanuelSecret',
        'latitude': '$latitude',
        'longitude': '$longitude',
        'birth_date': '$birthDate',
        'birth_time': '$birthTime',
        'house_system': '$kHouseSystem',
      },
    );
    if (response.statusCode == 200) {
      birthChartData = jsonDecode(response.body);
      return birthChartData;
    } else {
      print('Response status: ${response.statusCode}');
    }
  }
}
