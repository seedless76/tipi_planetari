import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominant_calculation.dart';

class Dominants {
  //Map<kPlanetsNames, int> dominants;

  Map<kPlanetsNames, int> calculate(var birthChart) {
    Map<kPlanetsNames, int> dominants = Map();
    kPlanetsNames.values.forEach((planet) {
      print('Computo $planet...');
      dominants[planet] =
          getDominantValue(birthChart: birthChart, dominantPlanet: planet);
      print(dominants);
    });
    return dominants;
  }
}
