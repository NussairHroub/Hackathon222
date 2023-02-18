import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/models/club.dart';
import 'package:kfupm_clubs/services/database.dart';

import '../../models/event.dart';

class EventsOfClub extends ConsumerStatefulWidget {
  EventsOfClub({Key? key, required this.club}) : super(key: key);
  final Club club;
  @override
  EventsOfClubState createState() => EventsOfClubState();
}

class EventsOfClubState extends ConsumerState<EventsOfClub> {
  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventsFutureProvider);
    return events.when(
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => Center(
        child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
      ),
      data: (events) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${widget.club.name} Club Events'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                  children: events
                      .where((element) => element.clubId == widget.club.id)
                      .map((event) {
                return MyEventTile(
                  clubName: widget.club.name,
                  startTime: event.startTime,
                  event: event,
                );
              }).toList()),
            ),
          ),
        );
      },
    );
  }
}

class MyEventTile extends StatefulWidget {
  const MyEventTile(
      {Key? key,
      required this.event,
      required this.startTime,
      required this.clubName})
      : super(key: key);

  final Event event;
  final String startTime;
  final String clubName;

  @override
  State<MyEventTile> createState() => _MyEventTileState();
}

class _MyEventTileState extends State<MyEventTile> {
  DateTime finalDate = DateTime.now();
  final double _timeLeft = 0.5;
  Duration _left = Duration(milliseconds: 0);
  int _days = 0;
  int _hours = 0;
  bool _isInDays = false;
  bool _isFinished = false;

//  TODO: calculate the percentage

  @override
  void initState() {
    super.initState();
    //  finalDate = DateTime.parse(widget.startTime.substring(0, 10));
    finalDate = DateTime.parse(widget.startTime);

    _left = finalDate.difference(DateTime.now());
    _days = _left.inDays;
    _isInDays = _days > 0;
    _hours = _left.inHours;
    _isFinished = (_days <= 0 && _hours <= 0);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/eventDetailsPage',
              arguments: widget.event);
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff7C7C7C))),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                children: [
                  ClipOval(
                      child: Image.asset(
                    "assets/${widget.clubName}-club.jpg",
                    height: 65,
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.event.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 200,
                          height: 8,
                          child: LinearProgressIndicator(
                            value: _timeLeft,
                            backgroundColor: Color(0xffe0e1dd),
                            valueColor:
                                new AlwaysStoppedAnimation(Color(0xffdecd6a)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        _isFinished
                            ? "Finshed"
                            : _isInDays
                                ? "${_days} Days Left"
                                : "${_hours} Hours Left",
                        style: _isFinished
                            ? TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red)
                            : null,
                        // _isInDays ? "${_days} Days Left" : "${_hours} Hours Left",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
