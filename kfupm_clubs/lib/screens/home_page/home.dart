import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return 
      
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () => {}, child: Text('Sign in')),
                Container(
                  child: Text('search bar'),
                )
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                cacheExtent: 999999,
                childAspectRatio: 0.7 / 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                scrollDirection: Axis.vertical,
                children: [
                  EventCard(),
                  EventCard(),
                  EventCard(),
                  EventCard(),
                  EventCard(),
                  EventCard(),
                  EventCard(),
                  EventCard(),
                ],
              ),
            ),
          ],
        ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      decoration: BoxDecoration(
          color: Color(0xff92f8ad), borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          child: Image.asset("assets/Computer-club.jpg"),
        ),
        Expanded(
            child: Center(
                child: Text(
          "Event Name",
          style:
              TextStyle(color: Color(0xff00210c), fontWeight: FontWeight.bold),
        )))
      ]),
    );
  }
}
