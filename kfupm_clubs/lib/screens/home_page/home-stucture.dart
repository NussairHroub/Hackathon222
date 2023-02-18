import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/models/user.dart';
import 'package:kfupm_clubs/providers/auth_provider.dart';
import 'package:kfupm_clubs/screens/home_page/myEvents.dart';
import 'package:kfupm_clubs/screens/profile/profile_page.dart';
import 'package:kfupm_clubs/services/database.dart';
import 'home.dart';

class HomeStructure extends ConsumerStatefulWidget {
  HomeStructure({Key? key}) : super(key: key);

  @override
  HomeStructureState createState() => HomeStructureState();
}

class HomeStructureState extends ConsumerState<HomeStructure> {
  int _currentIndex = 1;
  List<Widget> body = [
    MyEventsPage(),
    HomePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

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
            InkWell(
              onTap: (() => auth.signOut()),
              child: Icon(
                Icons.logout_outlined,
                size: 32,
              ),
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
              const BottomNavigationBarItem(
                icon: Icon(Icons.assignment_turned_in),
                label: "My Events",
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Home"),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ]),
      ),
    );
  }
}
