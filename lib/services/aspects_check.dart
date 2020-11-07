import 'package:dominanti_planetarie/constants.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';

double _angleDiff(double angle1, double angle2) {
  return (angle2 - angle1).abs() <= 180 ? (angle2 - angle1).abs() : 360 - (angle1 - angle2).abs();
}

bool planetAngleConjunction({@required birthChart, @required PlanetName planet, @required BirthChartAngles angle}) {
  String stringPlanet = EnumToString.convertToString(planet);
  String stringAngle = EnumToString.convertToString(angle);
  double angle1 = birthChart['planets'][stringPlanet]['chartAngle'];
  double angle2 = birthChart['angles'][stringAngle]['chartAngle'];
  return (_angleDiff(angle1, angle2) <= kConjunction);
}

bool planetPlanetConjunction({@required birthChart, @required PlanetName planet1, @required PlanetName planet2}) {
  String _stringPlanet1 = EnumToString.convertToString(planet1);
  String _stringPlanet2 = EnumToString.convertToString(planet2);
  double angle1 = birthChart['planets'][_stringPlanet1]['chartAngle'];
  double angle2 = birthChart['planets'][_stringPlanet2]['chartAngle'];
  return (_angleDiff(angle1, angle2) <= kConjunction);
}

bool angleInSign({@required birthChart, @required BirthChartAngles angle, @required Signs sign}) {
  String stringAngle = EnumToString.convertToString(angle);
  String stringSign = EnumToString.convertToString(sign);
  return (birthChart['angles'][stringAngle]['sign'] == stringSign);
}

bool planetInSign({@required birthChart, @required PlanetName planet, @required Signs sign}) {
  String _stringPlanet = EnumToString.convertToString(planet);
  String _stringSign = EnumToString.convertToString(sign);
  return (birthChart['planets'][_stringPlanet]['sign'] == _stringSign);
}

bool stelliumInSign({@required birthChart, @required Signs sign}) {
  String _stringSign = EnumToString.convertToString(sign);
  String _stringPlanet;
  int _planetsInSign = 0;
  PlanetName.values.forEach((planet) {
    _stringPlanet = EnumToString.convertToString(planet);
    if (birthChart['planets'][_stringPlanet]['sign'] == _stringSign) {
      _planetsInSign++;
    }
  });
  return (_planetsInSign >= kStelliumPlanetsNr);
}

House getBirthChartHouses({@required birthChart, @required int houseNr}) {
  House _house = House(init: 0.0, end: 0.0);
  String _stringHouseNr = houseNr.toString();
  String _stringNextHouseNr = (houseNr + 1).toString();
  _house.init = birthChart['houses'][_stringHouseNr]['chartAngle'];
  // La fine della casa è l'inizio della casa successiva, tranne nel caso di casa 12 che è l'inizio della casa 1
  _house.end = houseNr != 12
      ? birthChart['houses'][_stringNextHouseNr]['chartAngle']
      : birthChart['houses'][1.toString()]['chartAngle'];
  return _house;
}

bool planetInHouse({@required birthChart, @required PlanetName planet, @required int houseNr}) {
  bool _planetInHouse;
  House _house = getBirthChartHouses(birthChart: birthChart, houseNr: houseNr);
  String _stringPlanet = EnumToString.convertToString(planet);
  double _planetAngle = birthChart['planets'][_stringPlanet]['chartAngle'];
  _planetInHouse = (_house.end > _house.init)
      ? ((_planetAngle > _house.init) && (_planetAngle <= _house.end))
      : ((_planetAngle > _house.init) || (_planetAngle <= _house.end));
  return _planetInHouse;
}

bool stelliumInHouse({@required birthChart, @required int houseNr}) {
  int _planetsInSign = 0;
  PlanetName.values.forEach((planet) {
    if (planetInHouse(birthChart: birthChart, planet: planet, houseNr: houseNr)) {
      // print('trovato $planet in casa $houseNr');
      _planetsInSign++;
    }
  });
  return (_planetsInSign >= kStelliumPlanetsNr);
}
