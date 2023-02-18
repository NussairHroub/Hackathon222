import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/models/event.dart';
import 'package:kfupm_clubs/services/database.dart';

class MyEventsPage extends ConsumerStatefulWidget {
  const MyEventsPage({Key? key}) : super(key: key);

  @override
  MyEventsPageState createState() => MyEventsPageState();
}

class MyEventsPageState extends ConsumerState<MyEventsPage> {
  @override
  Widget build(BuildContext context) {
    final events = ref.watch(userToEventFutureProvider);

    return events.when(
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => Center(
        child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
      ),
      data: (events) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                  children: events.map((event) {
                return MyEventTile(
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
  const MyEventTile({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<MyEventTile> createState() => _MyEventTileState();
}

class _MyEventTileState extends State<MyEventTile> {
  double _timeLeft = 1;
  Duration _left = Duration(milliseconds: 0);
  Duration _totalDuration = Duration(milliseconds: 0);
  int _days = 0;
  int _hours = 0;
  bool _isInDays = false;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    DateTime _startDateDate = DateTime.parse(widget.event.startTime);
    DateTime _createdDateDate = DateTime.parse(widget.event.timeCreated);
    _left = _startDateDate.difference(DateTime.now());
    _days = _left.inDays;
    _isInDays = _days > 0;
    _hours = _left.inHours;
    _isFinished = (_days <= 0 && _hours <= 0);

    if (!_isFinished) {
      _totalDuration = _startDateDate.difference(_createdDateDate);
      _timeLeft = 1 - (_left.inHours / _totalDuration.inHours);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
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
                    // TODO: figure out away to get the club image
                    widget.event.image,
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
                        '${widget.event.name}',
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
