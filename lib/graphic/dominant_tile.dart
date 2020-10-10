import 'package:dominanti_planetarie/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:dominanti_planetarie/graphic/reusable_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'graphic_constants.dart';

class DominantTile extends StatelessWidget {
  DominantTile(
      {@required this.planetNameIndex,
      @required this.dominantValue,
      @required this.maxDominantValue});

  final int planetNameIndex;
  final int dominantValue;
  final double maxDominantValue;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: Colors.black12,
      cardChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    kSymbolsName[planetNameIndex],
                    color: Color(mainColor),
                    matchTextDirection: true,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '$dominantValue',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50.0,
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: LiquidLinearProgressIndicator(
              value: (dominantValue / maxDominantValue), // Defaults to 0.5.
              valueColor: AlwaysStoppedAnimation(Color(
                  0xFFFE6054)), // Defaults to the current Theme's accentColor.
              backgroundColor: Color(
                  0xFFFF773D), // Defaults to the current Theme's backgroundColor.
              borderColor: Color(0xFFFE6054),
              borderWidth: 2.0,
              borderRadius: 12.0,
              direction: Axis.horizontal,
              center: Text(''),
            ),
          ),
        ],
      ),
    );
  }
}
