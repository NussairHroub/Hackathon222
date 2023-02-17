import 'package:flutter/material.dart';
import 'package:kfupm_clubs/models/event.dart';

class Date extends StatelessWidget {
  const Date({Key? key, required this.event}) : super(key: key);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text('Start Date: ',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            Text(event.timeCreated, style: TextStyle(fontSize: 18)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children:  [
            Text('Duration: ',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            Text(event.duration, style: TextStyle(fontSize: 18)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children:  [
            Text('Registration Date: ',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            Text(event.startTime, style: TextStyle(fontSize: 18)),
          ],
        ),
      ]),
    );
  }
}
