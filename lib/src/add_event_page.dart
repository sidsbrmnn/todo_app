import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/custom_button.dart';
import 'widgets/custom_textfield.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String _selectedDate = 'Pick date';
  String _selectedTime = 'Pick time';

  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().add(Duration(days: -365)),
      lastDate: new DateTime.now().add(Duration(days: 365)),
    );
    if (datepick != null)
      setState(() {
        _selectedDate = new DateFormat.yMd().format(datepick);
      });
  }

  Future _pickTime() async {
    TimeOfDay timepick = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    if (timepick != null) {
      final now = new DateTime.now();
      setState(() {
        _selectedTime = new DateFormat.Hm().format(new DateTime(
            now.year, now.month, now.day, timepick.hour, timepick.minute));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              'Add new event',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          CustomTextField(
            labelText: 'Event',
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
          ),
          SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            labelText: 'Calendar',
            textCapitalization: TextCapitalization.sentences,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child:
                    _dateTimePicker(Icons.date_range, _pickDate, _selectedDate),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: _dateTimePicker(
                    Icons.access_time, _pickTime, _selectedTime),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'Cancel',
              ),
              CustomButton(
                onPressed: () {},
                text: 'Add',
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _dateTimePicker(IconData icon, VoidCallback onPressed, String value) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Theme.of(context).disabledColor)),
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Icon(icon, color: Theme.of(context).accentColor, size: 30),
          SizedBox(
            width: 12,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
