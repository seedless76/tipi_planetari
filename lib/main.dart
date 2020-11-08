import 'package:flutter/material.dart';

import 'graphic/input_form.dart';

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
      // home: WelcomeScreen(),
      home: InputForm(),
      // home: BirthCityWidget(),
    );
  }
}
