import 'package:flutter/material.dart';
import 'package:dominanti_planetarie/screens/loading_screen.dart';
import 'package:dominanti_planetarie/screens/dominants_screen.dart';

import 'screens/dominants_screen.dart';

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
