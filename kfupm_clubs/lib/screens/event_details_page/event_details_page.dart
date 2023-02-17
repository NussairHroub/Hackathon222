import 'package:flutter/material.dart';
import 'package:kfupm_clubs/screens/event_details_page/event_info.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/event_bottom_bar.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/event_picture.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/event_toggle_bar.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              EventPicture(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Event Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              EventInfo(),
              SizedBox(
                height: 20,
              ),
              Expanded(child: EventToggleBar()),
              SizedBox(
                height: 20,
              ),
              EventBottomBar(),
            ],
          ),
        ));
  }
}
