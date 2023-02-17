import 'package:flutter/material.dart';

class EventPicture extends StatelessWidget {
  const EventPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: NetworkImage('https://picsum.photos/250?image=9'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
