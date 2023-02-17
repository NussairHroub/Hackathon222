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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50, child: Image.asset('assets/kfupm-logo.png')),
            Text(
              ' Titile',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 125, 65),
              ),
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
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
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Following",),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "Profile")
      ]),
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
            decoration: BoxDecoration(color: Color(0xff92f8ad), borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              ClipRRect(borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset("assets/Computer-club.jpg"),),
              Expanded(child: Center(child: Text("Event Name", style: TextStyle(color: Color(0xff00210c), fontWeight: FontWeight.bold),)))
            ]),
          );
  }
}
