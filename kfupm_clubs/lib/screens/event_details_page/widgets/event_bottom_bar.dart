import 'package:flutter/material.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class EventBottomBar extends StatefulWidget {
  const EventBottomBar({Key? key}) : super(key: key);

  @override
  State<EventBottomBar> createState() => _EventBottomBarState();
}

class _EventBottomBarState extends State<EventBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          //time down counter
          children: [
            Text('10', style: sourceCodePro32Font),
            Text(':', style: sourceCodePro32Font),
            Text('50', style: sourceCodePro32Font),
          ],
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 135,
            height: 45,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Register Me',
                style: sourceCodePro16Font,
              ),
            ),
          ),
        )
      ],
    );
  }
}
