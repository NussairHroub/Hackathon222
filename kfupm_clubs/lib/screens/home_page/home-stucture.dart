import 'package:flutter/material.dart';
import 'package:kfupm_clubs/screens/home_page/myEvents.dart';
import 'home.dart';

class HomeStructure extends StatefulWidget {
  HomeStructure({Key? key}) : super(key: key);

  @override
  State<HomeStructure> createState() => _HomeStructureState();
}

class _HomeStructureState extends State<HomeStructure> {
  int _currentIndex = 1;
  // TODO: add every page to the list
  List<Widget> body = [
    MyEventsPage(),
    HomePage(),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "KFUPM",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              ' CLUBS',
            ),
            Spacer(
              flex: 1,
            ),
            Icon(
              Icons.alarm_rounded,
              size: 32,
            ),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Color(0xff027E40),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: body[_currentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: BottomNavigationBar(
            selectedItemColor: Color(0xffDECD6A),
            unselectedItemColor: Colors.white,
            backgroundColor: Color(0xff027E40),
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_turned_in),
                label: "My Events",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ]),
      ),
    );
  }
}
