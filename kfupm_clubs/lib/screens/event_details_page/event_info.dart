import 'package:flutter/material.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.location_on,
          color: Colors.grey,
          size: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Building',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.calendar_today,
          color: Colors.grey,
          size: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Rigestration Due Date',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.chair_alt_outlined,
          color: Colors.grey,
          size: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Available Seats',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
