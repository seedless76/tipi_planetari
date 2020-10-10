import 'package:flutter/material.dart';
import 'package:dominanti_planetarie/screens/loading_screen.dart';
import 'package:dominanti_planetarie/screens/dominant_screen.dart';

import 'screens/dominant_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // home: LoadingScreen(),
      home: DominantScreen(),
    );
  }
}
