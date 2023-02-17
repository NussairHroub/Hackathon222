import 'package:flutter/material.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.details}) : super(key: key);
  final String details;
  @override
  Widget build(BuildContext context) {
    return Text(
        '${details}',
        style: sourceCodePro14DarkgreyFont);
  }
}
