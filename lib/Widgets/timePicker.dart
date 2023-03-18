import 'package:flutter/material.dart';

class TimePickerContainer extends StatefulWidget {
  final iconColor;
  const TimePickerContainer({Key? key, this.iconColor}) : super(key: key);


  @override
  _TimePickerContainerState createState() => _TimePickerContainerState();
}

class _TimePickerContainerState extends State<TimePickerContainer> {
  TimeOfDay? _selectedTime;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: _selectedTime ?? TimeOfDay.now(),
        );

        if (pickedTime != null && pickedTime != _selectedTime) {
          setState(() {
            _selectedTime = pickedTime;
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 84,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: _selectedTime == null
            ? Text(
          'اختر الوقت',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _selectedTime!.format(context),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Icon(Icons.watch_later_outlined, color: widget.iconColor),
          ],
        ),
      ),
    );
  }
}
