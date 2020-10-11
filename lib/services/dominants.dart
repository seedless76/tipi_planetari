import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominant_calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:sortedmap/sortedmap.dart';

class BirthChartDominants {
  BirthChartDominants({@required this.birthChart});
  final birthChart;

  Map<kPlanetsNames, int> calculate() {
    Map<kPlanetsNames, int> dominants = Map();
    kPlanetsNames.values.forEach((planet) {
      // print('Computo $planet...');
      dominants[planet] =
          getDominantValue(birthChart: birthChart, dominantPlanet: planet);
      // print(dominants);
    });
    print('Le dominanti non ordinate: $dominants');
    var sortedKeys = dominants.keys.toList(growable: false);
    sortedKeys.sort((k1, k2) => dominants[k2].compareTo(dominants[k1]));
    print(
        'La mappa ordinata è: ${Map.fromIterable(sortedKeys, key: (k) => k, value: (k) => dominants[k])}');
    return Map.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => dominants[k]);
  }

  int dominantValue(
      {@required var dominantsData, @required kPlanetsNames planet}) {
    return dominantsData[planet];
  }
}
