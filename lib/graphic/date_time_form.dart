import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dominanti_planetarie/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  //TODO add a form field to select the Birth city of the users.
  //TODO calculate longitude and latitude of the Birth city to pass to the birthchart calculator

  final formKey = GlobalKey<FormState>();
  final dateFormFormat = DateFormat("dd-MM-yyyy");
  final dateStringFormat = DateFormat("yyyy-MM-dd"); //La data va passata all'API in formato US
  final timeFormat = DateFormat("HH:mm");
  DateTime userBirthDate;
  String userBirthDateString;
  DateTime userBirthTime;
  String userBirthTimeString;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Inserisci la tua data di nascita'),
            DateTimeField(
              format: dateFormFormat,
              autovalidate: true,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime.now());
              },
              onSaved: (DateTime value) {
                userBirthDate = value;
                userBirthDateString = dateStringFormat.format(userBirthDate).toString();
                print('Selezionata la data del $userBirthDate');
                print('Passerò ' + userBirthDateString);
              },
            ),
          ]),
          SizedBox(height: 24),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Inserisci l\'ora della tua nascita'),
            DateTimeField(
              format: timeFormat,
              autovalidate: true,
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.convert(time);
              },
              onSaved: (DateTime value) {
                userBirthTime = value;
                userBirthTimeString = timeFormat.format(userBirthTime).toString();
                print('Selezionata l\'ora $userBirthTime');
                print('Passerò ' + userBirthTimeString);
              },
            ),
          ]),
          SizedBox(height: 24),
          Center(
            child: RaisedButton(
              child: Text('Calcola'),
              onPressed: () {
                print('Sto salvando il form');
                formKey.currentState.save();
                if (formKey.currentState.validate()) {
                  print('Sto per chiamare Loading screen con ' + userBirthTimeString + ' e ' + userBirthDateString);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(
                        userBirthTime: userBirthTimeString,
                        userBirthDate: userBirthDateString,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
