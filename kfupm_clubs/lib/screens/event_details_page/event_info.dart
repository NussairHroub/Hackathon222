import 'package:flutter/material.dart';
import 'package:kfupm_clubs/models/event.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class EventInfo extends StatelessWidget {
  const EventInfo(
      {Key? key,
      required this.event})
      : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {

    String _startTime = event.startTime;
    String _location = event.location;
    int _seatsAvailable = event.maxSeats - event.seatsTaken;

    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: primaryColor,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text('${_location}', style: sourceCodePro12Font),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(
              Icons.calendar_today,
              color: primaryColor,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text('${_startTime}', style: sourceCodePro12Font),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(
              Icons.chair_alt_outlined,
              color: primaryColor,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text('${_seatsAvailable}', style: sourceCodePro12Font),
          ],
        ),
      ],
    );
  }
}
