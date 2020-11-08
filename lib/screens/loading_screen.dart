import 'package:dominanti_planetarie/graphic/graphic_constants.dart';
import 'package:dominanti_planetarie/screens/dominants_screen.dart';
import 'package:dominanti_planetarie/services/birth_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  LoadingScreen(
      {@required this.userBirthDate,
      @required this.userBirthTime,
      @required this.userBirthCityLat,
      @required this.userBirthCityLong});
  final String userBirthDate;
  final String userBirthTime;
  final String userBirthCityLong;
  final String userBirthCityLat;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print('Sono dentro a Loading Screen: ${widget.userBirthDate} ${widget.userBirthTime}');
    getBirthChartData(
        birthDate: widget.userBirthDate,
        birthTime: widget.userBirthTime,
        birthCityLat: widget.userBirthCityLat,
        birthCityLong: widget.userBirthCityLong);
  }

  // Calculate BirthChart data
  void getBirthChartData({String birthDate, String birthTime, String birthCityLat, String birthCityLong}) async {
    //Creo l'istanza
    BirthChart userBirthChart =
        BirthChart(latitude: birthCityLat, longitude: birthCityLong, birthDate: birthDate, birthTime: birthTime);

    //Creo i valori del tema e carico i dati
    var userBirthChartData = await userBirthChart.getBirthChartData();

    //Passo i dati alla schermata delle dominanti
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return DominantScreen(birthChartData: userBirthChartData);
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
