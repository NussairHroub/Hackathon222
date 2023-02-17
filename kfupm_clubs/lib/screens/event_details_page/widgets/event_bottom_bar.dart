import 'package:flutter/material.dart';

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
          children: const [
            Text('Time Left: ', style: TextStyle(fontSize: 17)),
            Text('47', style: TextStyle(fontSize: 17)),
            Text(':', style: TextStyle(fontSize: 17)),
            Text('16', style: TextStyle(fontSize: 17)),
          ],
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.yellow[600],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
