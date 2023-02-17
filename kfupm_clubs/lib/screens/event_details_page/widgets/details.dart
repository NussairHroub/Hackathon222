import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        child: Text(
            'Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details',
            style: TextStyle(fontSize: 18, height: 1.5, color: Colors.grey)),
      ),
    );
  }
}
