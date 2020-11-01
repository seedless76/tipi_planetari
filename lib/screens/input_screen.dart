import 'package:dominanti_planetarie/graphic/date_time_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  static String id = 'input_screen';
  // final DateTimeField
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Inserisci i tuoi dati'),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            children: [DateTimeForm()],
          )),
    );
  }
}
