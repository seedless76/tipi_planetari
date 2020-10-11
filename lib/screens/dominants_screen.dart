import 'package:dominanti_planetarie/graphic/graphic_constants.dart';
import 'package:dominanti_planetarie/services/birth_chart.dart';
import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dominanti_planetarie/graphic/dominant_tile.dart';

class DominantScreen extends StatefulWidget {
  DominantScreen({@required this.birthChartData, @required this.dominantsData});
  final birthChartData;
  final dominantsData;

  @override
  _DominantScreenState createState() => _DominantScreenState();
}

class _DominantScreenState extends State<DominantScreen> {
  List<kPlanetsNames> _dominantsPlanets;
  List<int> _dominantsValues;

  @override
  void initState() {
    super.initState();
    updateUI(widget.birthChartData, widget.dominantsData);
  }

  void updateUI(dynamic birthChartData, dynamic dominantsData) {
    setState(() {
      Map<kPlanetsNames, int> dominantsData =
          BirthChartDominants(birthChart: birthChartData).calculate();
      _dominantsPlanets = dominantsData.keys.toList();
      _dominantsValues = dominantsData.values.toList();
      // for (var planet in PlanetName) {
      //   print('La dominante di $planet è ${dominantsData[planet]}');
      kPlanetsNames.values.forEach((planet) {
        print(
            'La dominante di $planet è ${BirthChartDominants().dominantValue(dominantsData: dominantsData, planet: planet)}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        title: Text('Your planets dominant data'),
        centerTitle: true,
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => DominantTile(
          planet: Planet(_dominantsPlanets[index]),
          dominantValue: _dominantsValues[index],
          maxDominantValue: 20.0,
        ),
        staggeredTileBuilder: (int index) => StaggeredTile.count(
            index == 0
                ? 4
                : index == 1 || index == 2
                    ? 2
                    : 4,
            index == 0
                ? 3
                : index == 1 || index == 2
                    ? 2
                    : 2),
      ),
    );
  }
}
