import 'package:dominanti_planetarie/services/dominant_calculation.dart';
import 'package:dominanti_planetarie/constants.dart';

Map<PlanetName, int> dominants(birthChart) {
  var _unsortedDominants = Map();
  PlanetName.values.forEach((planet) {
    _unsortedDominants[planet] = getDominantValue(birthChart: birthChart, dominantPlanet: planet);
  });
  var sortedKeys = _unsortedDominants.keys.toList(growable: false);
  sortedKeys.sort((k1, k2) => _unsortedDominants[k2].compareTo(_unsortedDominants[k1]));
  return Map.fromIterable(sortedKeys, key: (k) => k, value: (k) => _unsortedDominants[k]);
}

int dominantsTotalValue(dominantsData) {
  int _value = 0;
  // print('Calcolo il valore totale delle dominanti...');
  PlanetName.values.forEach((planet) {
    print('${dominantsData[planet]}');
    _value = _value + dominantsData[planet];
  });
  return _value;
}
