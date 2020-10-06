import 'package:flutter/material.dart';
import 'package:dominanti_planetarie/services/dominants.dart';
import 'package:dominanti_planetarie/services/constants.dart';

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
    updateUI(widget.birthChartData);
  }

  void updateUI(dynamic birthCartData) {
    var dominantsData =
        DominantsValue(birthChart: birthCartData).calculateDominants();
    // for (var planet in PlanetName) {
    //   print('La dominante di $planet è ${dominantsData[planet]}');
    PlanetName.values.forEach((planet) {
      print('La dominante di $planet è ${dominantsData[planet]}');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
