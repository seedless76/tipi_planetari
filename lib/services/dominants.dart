import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominant_calculation.dart';
import 'package:flutter/cupertino.dart';

class BirthChartDominants {
  BirthChartDominants({@required this.birthChart});
  final birthChart;

  Map<kPlanetsNames, int> calculate() {
    Map<kPlanetsNames, int> dominants = Map();
    kPlanetsNames.values.forEach((planet) {
      print('Computo $planet...');
      dominants[planet] =
          getDominantValue(birthChart: birthChart, dominantPlanet: planet);
      print(dominants);
    });
    return dominants;
  }

  int dominantValue(
      {@required var dominantsData, @required kPlanetsNames planet}) {
    return dominantsData[planet];
  }
}
