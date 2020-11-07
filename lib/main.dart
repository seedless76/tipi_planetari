import 'dart:io';

import 'package:dominanti_planetarie/graphic/graphic_constants.dart';
import 'package:dominanti_planetarie/screens/dominants_screen.dart';
import 'package:dominanti_planetarie/screens/input_screen.dart';
import 'package:dominanti_planetarie/screens/loading_screen.dart';
import 'package:dominanti_planetarie/screens/welcome_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dominanti_planetarie/screens/input_screen.dart';
import 'package:dominanti_planetarie/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
// import 'package:dominanti_planetarie/screens/loading_screen.dart';
// import 'package:dominanti_planetarie/screens/dominants_screen.dart';

import 'screens/dominants_screen.dart';

void main() {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   if (kReleaseMode) exit(1);
  // };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
      // home: DominantScreen(),
    );
  }
}
