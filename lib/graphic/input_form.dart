import 'package:dominanti_planetarie/graphic/date_time_form.dart';
import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Inserisci i tuoi dati per il calcolo del tema natale',
            maxLines: 2,
            softWrap: true,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Text('COMPILED AT $time'),
            DateTimeForm(),
          ],
        ),
      ),
    );
  }
}
