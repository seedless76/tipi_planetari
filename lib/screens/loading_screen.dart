import 'package:dominanti_planetarie/graphic/graphic_constants.dart';
import 'package:dominanti_planetarie/screens/dominants_screen.dart';
import 'package:dominanti_planetarie/services/birth_chart.dart';
import 'package:flutter/cupertino.dart';
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
  // var userBirthChartData;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    var userBirthChartData;
    void _getBirthChartData({String birthDate, String birthTime, String birthCityLat, String birthCityLong}) async {
      //Creo l'istanza
      BirthChart userBirthChart =
          BirthChart(latitude: birthCityLat, longitude: birthCityLong, birthDate: birthDate, birthTime: birthTime);
      // Creo i valori del tema e carico i dati
      try {
        userBirthChartData = await userBirthChart.getBirthChartData();
      } catch (e) {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('Errore nell\'esecuzione della chiamata API'),
                content: Text('Il sito ha restituito un errore HTTP $e'),
                actions: [
                  TextButton(
                    child: Text('Riprova'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
      //Passo i dati alla schermata delle dominanti
      if (birthDate != null) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return DominantScreen(birthChartData: userBirthChartData);
        }), (route) => false);
      } else {
        AlertDialog(
          title: Text('Qualcosa è andato storto'),
          content: Text('😒 Non è stato possibile caricare i dati del tema natale. Riprova'),
          actions: [
            MaterialButton(
              elevation: 5.0,
              child: Text('Riprova'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
        Navigator.of(context).pop();
      }
    }

    super.initState();
    print('Sono dentro a Loading Screen: ${widget.userBirthDate} ${widget.userBirthTime}');
    _getBirthChartData(
        birthDate: widget.userBirthDate,
        birthTime: widget.userBirthTime,
        birthCityLat: widget.userBirthCityLat,
        birthCityLong: widget.userBirthCityLong);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calcolo i tuoi pianeti...', style: kTitleTextStyle),
            SpinKitThreeBounce(
              color: kMainColor,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
