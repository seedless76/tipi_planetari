import 'package:dominanti_planetarie/screens/dominants_screen.dart';
import 'package:dominanti_planetarie/services/birth_chart.dart';
import 'package:dominanti_planetarie/constants.dart';
import 'package:dominanti_planetarie/services/dominants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  final DateTime userBirthDate;
  final DateTime userBirthTime;
  // LoadingScreen({@required this.userBirthDate, @required this.userBirthTime});
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
      latitude: '40.8333336',
      longitude: '14.116667',
      birthDate: '1994-01-14',
      birthTime: '18:30',
    ).getBirthChart();
    var dominantsData = BirthChartDominants(birthChart: birthChartData).calculate();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return DominantScreen(
        birthChartData: birthChartData,
        dominantsData: dominantsData,
      );
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Loading birthchart data...', style: kTitleTextStyle),
            SpinKitThreeBounce(
              color: Colors.white,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
