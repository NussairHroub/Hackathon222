import 'package:flutter/material.dart';
import 'package:kfupm_clubs/screens/event_details_page/event_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EventDetailsPage(),
            ),
          );
        },
        child: const Text('Go to Event Details Page'),
      ),
    );
  }
}
