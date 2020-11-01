import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  final formKey = GlobalKey<FormState>();
  DateTime userBirthDate;
  DateTime userBirthTime;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BasicDateField(),
          SizedBox(height: 24),
          BasicTimeField(),
          SizedBox(height: 24),
          Center(
            child: RaisedButton(
              child: Text('Calcola'),
              onPressed: () {
                formKey.currentState.validate();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  var DateTime userData;
  final format = DateFormat("dd-MM-yyyy");
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text('Inserisci la tua data di nascita'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime.now());
        },
        onSaved: (DateTime value) {
                      userData = value;
          })
        }
      ),
    ]);
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Inserisci l\'ora della tua nascita'),
      DateTimeField(
        format: format,
        // onFieldSubmitted: (DateTime value){
        //   userBirt
        // },
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}
