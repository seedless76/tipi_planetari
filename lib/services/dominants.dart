import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominant_calculation.dart';
import 'package:flutter/cupertino.dart';

class BirthChartDominants {
  BirthChartDominants({@required this.birthChart});
  final birthChart;

  Map<kPlanetsNames, int> calculate() {
    Map<kPlanetsNames, int> dominants = Map();
    kPlanetsNames.values.forEach((planet) {
      dominants[planet] =
          getDominantValue(birthChart: birthChart, dominantPlanet: planet);
    });
    var sortedKeys = dominants.keys.toList(growable: false);
    sortedKeys.sort((k1, k2) => dominants[k2].compareTo(dominants[k1]));
    return Map.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => dominants[k]);
  }

  int dominantValue(
      {@required var dominantsData, @required kPlanetsNames planet}) {
    return dominantsData[planet];
  }

  double overallValue({@required var dominantsData}) {
    double _value = 0.0;
    kPlanetsNames.values.forEach((planet) {
      _value = _value + dominantsData[planet];
    });
    return _value;
  }
}
