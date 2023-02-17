import 'package:flutter/material.dart';
import 'package:kfupm_clubs/models/event.dart';
import 'package:kfupm_clubs/screens/event_details_page/event_info.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/event_bottom_bar.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/event_picture.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/event_toggle_bar.dart';

import '../../utils/constant.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key, required this.event}) : super(key: key);
  final Event event;
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
            children: [
              // TODO: pass the path of the image here
              const EventPicture(),
              const SizedBox(
                height: 20,
              ),
              Text('${widget.event.name}', style: sourceCodePro20Font),
              const SizedBox(
                height: 20,
              ),
              EventInfo(event: widget.event),
              const SizedBox(
                height: 20,
              ),
              EventToggleBar(event: widget.event),
              const SizedBox(
                height: 20,
              ),
              const EventBottomBar(),
            ],
          ),
        ));
  }
}
