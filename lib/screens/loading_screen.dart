import 'package:dominanti_planetarie/screens/dominants_screen.dart';
import 'package:dominanti_planetarie/services/birth_chart.dart';
import 'package:dominanti_planetarie/services/constants.dart';
import 'package:dominanti_planetarie/services/dominants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  String id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    setState(() {
      super.initState();
      getData();
    });
  }

  // Carico i valori del tema natale e delle dominanti
  void getData() async {
    var birthChartData = await BirthChart(
      latitude: '44.4808962',
      longitude: '11.3497545',
      birthDate: '1976-10-18',
      birthTime: '13:15',
    ).getBirthChart();
    var dominantsData = dominants(birthChartData);
    print('Ho scaricato i dati del birthchart');
    PlanetName.values.forEach((planet) {
      print('La dominante di $planet è ${dominantsData[planet]}');
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return DominantScreen(
          birthChartData: birthChartData,
          dominantsData: dominantsData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading birthchart data...'),
      ),
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
