import 'package:flutter/material.dart';
import 'package:todo_app/src/events/models/event_data.dart';
import '../../widgets/custom_button.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_textfield.dart';
import 'package:intl/intl.dart';

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  String _selectedDate = 'Pick date';
  String _selectedTime = 'Pick time';
  String newEventTitle = '';
  String category = '';

  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().add(Duration(days: -365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (datepick != null)
      setState(() {
        _selectedDate = DateFormat.yMd().format(datepick);
      });
  }

  Future _pickTime() async {
    TimeOfDay timepick = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (timepick != null) {
      final now = DateTime.now();
      setState(() {
        _selectedTime = DateFormat.Hm().format(DateTime(
            now.year, now.month, now.day, timepick.hour, timepick.minute));
        print(_selectedDate);
        print(_selectedTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
            onChanged: (newText) {
              newEventTitle = newText;
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            labelText: 'Category',
            textCapitalization: TextCapitalization.sentences,
            onChanged: (newText) {
              category = newText;
            },
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
                onPressed: () {
                  Provider.of<EventData>(context, listen: false)
                      .addEvent(newEventTitle, _selectedTime, category);
                  EventData.sortEvents();
                  Navigator.pop(context);
                },
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Theme.of(context).accentColor, size: 28),
          SizedBox(
            width: 12,
          ),
          Text(
            value,
          )
        ],
      ),
    );
  }
}
