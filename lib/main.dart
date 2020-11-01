import 'dart:io';

import 'package:dominanti_planetarie/graphic/graphic_constants.dart';
import 'package:dominanti_planetarie/screens/dominants_screen.dart';
import 'package:dominanti_planetarie/screens/input_screen.dart';
import 'package:dominanti_planetarie/screens/loading_screen.dart';
import 'package:dominanti_planetarie/screens/welcome_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const appName = 'Tipi Planetari';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPageBackgroundColor,
        backgroundColor: kBackgroundColor,
        primaryColor: kMainColor,
        accentColor: kMainColor,
        textTheme: TextTheme(
            bodyText2: TextStyle(
              color: kMainColor,
            ),
            headline2: TextStyle(
              color: kMainColor,
              fontWeight: FontWeight.w600,
              //fontSize: 60.0,
            )),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        InputScreen.id: (context) => InputScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
        DominantScreen.id: (context) => DominantScreen(birthChartData: null, dominantsData: null),
      },
      // supportedLocales: [
      //   const Locale('it'),
      // ],
    );
  }
}
