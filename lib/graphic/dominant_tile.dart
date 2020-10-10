import 'package:dominanti_planetarie/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:dominanti_planetarie/graphic/reusable_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:enum_to_string/enum_to_string.dart';

class DominantTile extends StatelessWidget {
  DominantTile({@required this.planetIndex});
  final int planetIndex;
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: Colors.black12,
      cardChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: SvgPicture.asset(
              kSymbolsName[planetIndex],
              color: Color(0xFF3C87E5),
              matchTextDirection: true,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Dominante di ${EnumToString.toList(kPlanetsNames.values)[planetIndex]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
