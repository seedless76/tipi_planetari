import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominants.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dominanti_planetarie/graphic/reusable_card.dart';
import 'package:flutter/widgets.dart';
import '../graphic/reusable_card.dart';
import '../services/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../services/constants.dart';
import '../services/constants.dart';

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
        itemBuilder: (BuildContext context, int index) => ReusableCard(
          colour: Colors.black12,
          cardChild: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 4,
                child: SvgPicture.asset(
                  kSymbolsName[index],
                  color: Colors.blue,
                  matchTextDirection: true,
                ),
              ),
              Expanded(
                child: Text(
                  'Dominante di ${EnumToString.toList(kPlanetsNames.values)[index]}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        staggeredTileBuilder: (int index) => StaggeredTile.count(
            index == 0
                ? 4
                : index == 1 || index == 2
                    ? 2
                    : 1,
            index == 0
                ? 4
                : index == 1 || index == 2
                    ? 2
                    : 1),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}
