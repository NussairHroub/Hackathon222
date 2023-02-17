import 'package:flutter/material.dart';

class MyEventsPage extends StatefulWidget {
  MyEventsPage({Key? key}) : super(key: key);

  @override
  State<MyEventsPage> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyEventTile(
              eventName: "KFUPM Hackathon 2023",
              clubName: "Computer",
              finalDate: DateTime.utc(2023, 2, 20, 0, 0, 0),
              ),
              MyEventTile(
              eventName: "KFUPM Hackathon 2023",
              clubName: "Computer",
              finalDate: DateTime.utc(2023, 2, 20, 0, 0, 0),
              ),
              MyEventTile(
              eventName: "KFUPM Hackathon 2023",
              clubName: "Computer",
              finalDate: DateTime.utc(2023, 2, 20, 0, 0, 0),
              ),

              MyEventTile(
              eventName: "KFUPM Hackathon 2023",
              clubName: "Computer",
              finalDate: DateTime.utc(2023, 2, 20, 0, 0, 0),
              ),

              MyEventTile(
              eventName: "KFUPM Hackathon 2023",
              clubName: "Computer",
              finalDate: DateTime.utc(2023, 2, 20, 0, 0, 0),
              ),MyEventTile(
              eventName: "KFUPM Hackathon 2023",
              clubName: "Computer",
              finalDate: DateTime.utc(2023, 2, 20, 0, 0, 0),
              ),
        ],
      ),
    );
  }
}

class MyEventTile extends StatefulWidget {
  const MyEventTile(
      {Key? key,
      required this.eventName,
      required this.finalDate,
      required this.clubName})
      : super(key: key);

  final String eventName;
  final DateTime finalDate;
  final String clubName;

  @override
  State<MyEventTile> createState() => _MyEventTileState();
}

class _MyEventTileState extends State<MyEventTile> {
  final double _timeLeft = 0.5;
  Duration _left = Duration(milliseconds: 0);
  int _days = 0;
  int _hours = 0;
  bool _isInDays = false;

//  TODO: calculate the percentage

  @override
  void initState() {
    super.initState();
    _left = widget.finalDate.difference(DateTime.now());
    _days = _left.inDays;
    _isInDays = _days > 0;
    _hours = _left.inHours;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xff7C7C7C))
          ),
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
                      'KFUPM Hackathon 2023',
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
                          valueColor: new AlwaysStoppedAnimation(Color(0xffdecd6a)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      _isInDays ? "${_days} Days Left" : "${_hours} Hours Left",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
