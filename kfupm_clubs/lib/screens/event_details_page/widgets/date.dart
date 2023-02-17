import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  const Date({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: const [
            Text('Start Date: ',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            Text('2023-10-10', style: TextStyle(fontSize: 18)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Text('End Date: ',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            Text('2023-10-16', style: TextStyle(fontSize: 18)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Text('Registration Date: ',
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            Text('2023-10-10', style: TextStyle(fontSize: 18)),
          ],
        ),
      ]),
    );
  }
}
