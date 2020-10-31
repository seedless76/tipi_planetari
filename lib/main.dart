import 'package:dominanti_planetarie/screens/dominants_screen.dart';
import 'package:dominanti_planetarie/screens/registration_screen.dart';
import 'package:dominanti_planetarie/screens/welcome_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dominanti_planetarie/screens/loading_screen.dart';
import 'dart:io';

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
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen().id,
      routes: {
        WelcomeScreen().id: (context) => WelcomeScreen(),
        RegistrationScreen().id: (context) => RegistrationScreen(),
        LoadingScreen().id: (context) => LoadingScreen(),
        DominantScreen().id: (context) =>
            DominantScreen(birthChartData: null, dominantsData: null),
      },
      // home: DominantScreen(),
    );
  }
}
