import 'dart:convert';

import 'package:dominanti_planetarie/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BirthChart {
  BirthChart({@required this.latitude, @required this.longitude, @required this.birthDate, @required this.birthTime});
  final String latitude;
  final String longitude;
  final String birthDate;
  final String birthTime;

  Future<dynamic> getBirthChartData() async {
    String immanuelURL = kIsWeb ? kImmanuelWebURL : kImmanuelURL;
    print('Sono dentro a getBirthChart e sto effettuando la chiamata:');
    print('api_key: $kImmanuelApiKey api_secret: $kImmanuelSecret latitude: $latitude longitude: $longitude '
        'birth_date: $birthDate birth_time: $birthTime house_system: $kHouseSystem');
    final http.Response response = await http.post(
      '$immanuelURL',
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
      return jsonDecode(response.body);
    } else {
      print('Response status: ${response.statusCode}');
      //TODO ritornare qualcosa per gestire l'errore dell'API
    }
  }
}
