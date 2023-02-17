import 'package:flutter/material.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Text('Building', style: sourceCodePro12Font),
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
            Text('Rigestration Due Date', style: sourceCodePro12Font),
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
            Text('Available Seats', style: sourceCodePro12Font),
          ],
        ),
      ],
    );
  }
}
