import 'package:dominanti_planetarie/constants.dart';
import 'package:dominanti_planetarie/graphic/dominant_tile.dart';
import 'package:dominanti_planetarie/graphic/graphic_constants.dart';
import 'package:dominanti_planetarie/services/dominants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DominantScreen extends StatefulWidget {
  static String id = 'dominant_screen';
  DominantScreen({@required this.birthChartData, @required this.dominantsData});
  final birthChartData;
  final dominantsData;

  @override
  _DominantScreenState createState() => _DominantScreenState();
}

class _DominantScreenState extends State<DominantScreen> {
  List _dominantsPlanets = [];
  List _dominantsValues = [];
  int _dominantsTotal = 0;

  @override
  void initState() {
    super.initState();
    updateUI(widget.birthChartData, widget.dominantsData);
  }

  void updateUI(dynamic birthChartData, dynamic dominantsData) {
    setState(() {
      print('Viene chiamato updateUI');
      dominantsData = dominants(birthChartData);
      _dominantsTotal = dominantsTotalValue(dominantsData);
      _dominantsPlanets = dominantsData.keys.toList();
      _dominantsValues = dominantsData.values.toList();
      print('Il valore totale delle dominanti è $_dominantsTotal');
      // PlanetName.values.forEach((planet) {
      //   print('La dominante di $planet è ${dominantsData[planet]}');
      // });
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
            maxDominantValue: _dominantsTotal),
        staggeredTileBuilder: (int index) => StaggeredTile.count(
            index == 0
                ? 4
                : index == 1 || index == 2
                    ? 2
                    : 4,
            index == 0
                ? 4
                : index == 1 || index == 2
                    ? 3
                    : 2),
      ),
    );
  }
}
