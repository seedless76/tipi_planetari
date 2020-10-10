import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dominanti_planetarie/graphic/dominant_tile.dart';

class DominantScreen extends StatefulWidget {
  DominantScreen({this.birthChartData});

  final birthChartData;

  @override
  _DominantScreenState createState() => _DominantScreenState();
}

class _DominantScreenState extends State<DominantScreen> {
  @override
  void initState() {
    super.initState();
    // updateUI(widget.birthChartData);
  }

  // void updateUI(dynamic birthCartData) {
  //   var dominantsData =
  //       DominantsValue(birthChart: birthCartData).calculateDominants();
  //   // for (var planet in PlanetName) {
  //   //   print('La dominante di $planet è ${dominantsData[planet]}');
  //   PlanetsNames.values.forEach((planet) {
  //     print('La dominante di $planet è ${dominantsData[planet]}');
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your planets dominant data'),
        centerTitle: true,
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 10,
        // itemCount: kPlanetsNames.values.length,
        itemBuilder: (BuildContext context, int index) => DominantTile(
          planetNameIndex: index,
          dominantValue: 10 + index,
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
