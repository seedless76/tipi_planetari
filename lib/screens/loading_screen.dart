import 'package:dominanti_planetarie/graphic/graphic_constants.dart';
import 'package:dominanti_planetarie/screens/dominants_screen.dart';
import 'package:dominanti_planetarie/services/birth_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  LoadingScreen({@required this.userBirthDate, @required this.userBirthTime});
  final String userBirthDate;
  final String userBirthTime;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print('Sono dentro a Loading Screen: ${widget.userBirthDate} ${widget.userBirthTime}');
    getBirthChartData(birthDate: widget.userBirthDate, birthTime: widget.userBirthTime);
  }

  // Calculate BirthChart data
  void getBirthChartData({String birthDate, String birthTime}) async {
    var birthChartData =
        await BirthChart(latitude: '40.8333336', longitude: '14.116667', birthDate: birthDate, birthTime: birthTime)
            .getBirthChart();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return DominantScreen(birthChartData: birthChartData);
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
