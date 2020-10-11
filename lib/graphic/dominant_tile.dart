import 'package:dominanti_planetarie/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:dominanti_planetarie/graphic/reusable_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'graphic_constants.dart';

class DominantTile extends StatelessWidget {
  DominantTile(
      {@required this.planet,
      @required this.dominantValue,
      @required this.maxDominantValue});

  final Planet planet;
  final int dominantValue;
  final double maxDominantValue;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: kTileBackgroundColor,
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
                    planet.symbol(),
                    color: kSignColor,
                    matchTextDirection: true,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '$dominantValue',
                      style: kDominantNrStyle,
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
              valueColor: AlwaysStoppedAnimation(
                  kBarColor), // Defaults to the current Theme's accentColor.
              backgroundColor:
                  kBackgroundBarColor, // Defaults to the current Theme's backgroundColor.
              borderColor: kBackgroundBarColor,
              borderWidth: 0.0,
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
