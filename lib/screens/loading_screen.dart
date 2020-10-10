import 'package:dominanti_planetarie/screens/dominants_screen.dart';
import 'package:dominanti_planetarie/services/birth_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    setState(() {
      super.initState();
      getBirthChartData();
    });
  }

  void getBirthChartData() async {
    var birthChartData = await BirthChart(
      latitude: '38.164327',
      longitude: '15.536086',
      birthDate: '1976-10-18',
      birthTime: '13:15',
    ).getBirthChart();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return DominantScreen(
          birthChartData: birthChartData,
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
