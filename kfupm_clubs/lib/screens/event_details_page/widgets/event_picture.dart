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
          image: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/hackathon222-bb9f7.appspot.com/o/assets%2FGroup%2040.png?alt=media&token=4d15fcdd-d62f-4ecd-8328-07db4f15c5dd'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
