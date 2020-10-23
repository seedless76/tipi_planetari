import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominant_calculation.dart';
import 'constants.dart';

dominants(birthChart) {
  var _unsortedDominants = Map();
  PlanetsNames.values.forEach((planet) {
    _unsortedDominants[planet] =
        getDominantValue(birthChart: birthChart, dominantPlanet: planet);
  });
  var sortedKeys = _unsortedDominants.keys.toList(growable: false);
  sortedKeys.sort(
      (k1, k2) => _unsortedDominants[k2].compareTo(_unsortedDominants[k1]));
  return Map.fromIterable(sortedKeys,
      key: (k) => k, value: (k) => _unsortedDominants[k]);
}

double dominantsOverallValue(dominantsData) {
  double _value = 0.0;
  PlanetsNames.values.forEach((planet) {
    _value = _value + dominantsData[planet];
  });
  return _value;
}
