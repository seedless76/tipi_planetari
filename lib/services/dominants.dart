import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominant_calculation.dart';

class DominantsValue {
  Map<kPlanetsNames, int> dominants;

  List<Dominant> calculateDominants(var birthChart) {
    List<Dominant> dominants = Map();
    kPlanetsNames.values.forEach((planet) {
      print('Computo $planet...');
      dominants[planet] =
          getDominantValue(birthChart: birthChart, dominantPlanet: planet);
      print(dominants);
    });
    return dominants;
  }
}
