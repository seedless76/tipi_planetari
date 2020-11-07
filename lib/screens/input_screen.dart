import 'package:dominanti_planetarie/graphic/graphic_constants.dart';
import 'package:dominanti_planetarie/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 36, top: 80, right: 36, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Inserisci i tuoi dati',
                  textAlign: TextAlign.center,
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Data di nascita',
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  '25/09/2020',
                  textAlign: TextAlign.center,
                  style: kInputTextStyle,
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  'Ora di nascita',
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  '07:48 AM',
                  textAlign: TextAlign.center,
                  style: kInputTextStyle,
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  'Città di nascita',
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  'Paris, France',
                  textAlign: TextAlign.center,
                  style: kInputTextStyle,
                ),
                SizedBox(
                  height: 100,
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.blue),
                      height: 50,
                      child: Center(child: Text('Scopri i tuoi valori planetari', style: kTitleTextStyle)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
