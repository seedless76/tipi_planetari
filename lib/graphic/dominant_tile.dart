import 'package:dominanti_planetarie/constants.dart';
import 'package:dominanti_planetarie/graphic/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'graphic_constants.dart';

class DominantTile extends StatelessWidget {
  DominantTile({@required this.planet, @required this.dominantValue, @required this.maxDominantValue});

  final Planet planet;
  final int dominantValue;
  final int maxDominantValue;

  String dominantPercentage() {
    return (dominantValue / maxDominantValue * 100).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: kTileBackgroundColor,
      //TODO chiamare la descrizione del pianeta
      // onPress: (),
      cardChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  // child: kIsWeb
                  //     ? Image.network(
                  //         planet.symbol(),
                  //         color: kSignColor,
                  //         fit: BoxFit.contain,
                  //         matchTextDirection: true,
                  //       )
                  //     : SvgPicture.asset(
                  //         planet.symbol(),
                  //         color: kSignColor,
                  //         matchTextDirection: true,
                  //       ),
                  child: WebsafeSvg.asset(planet.symbol(), color: kSignColor),
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
              // top: 10,
              bottom: 10,
            ),
            child: LiquidLinearProgressIndicator(
              value: (dominantValue / maxDominantValue), // Defaults to 0.5.
              valueColor: AlwaysStoppedAnimation(kBarColor), // Defaults to the current Theme's accentColor.
              //backgroundColor: kBackgroundBarColor, // Defaults to the current Theme's backgroundColor.
              borderColor: kPageBackgroundColor,
              borderWidth: 0.0,
              borderRadius: 12.0,
              direction: Axis.horizontal,
              center: Text(dominantPercentage() + '%'),
            ),
          ),
        ],
      ),
    );
  }
}
