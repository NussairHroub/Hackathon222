import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/models/user.dart';
import 'package:kfupm_clubs/providers/auth_provider.dart';
import 'package:kfupm_clubs/screens/add_event/add_event_page.dart';
import 'package:kfupm_clubs/screens/home_page/myEvents.dart';
import 'package:kfupm_clubs/screens/profile/profile_page.dart';
import 'package:kfupm_clubs/services/database.dart';
import 'package:kfupm_clubs/utils/constant.dart';
import 'home.dart';

class HomeStructure extends ConsumerStatefulWidget {
  HomeStructure({Key? key, this.user}) : super(key: key);
  final UserModel? user;

  @override
  HomeStructureState createState() => HomeStructureState();
}

class HomeStructureState extends ConsumerState<HomeStructure> {
  int _currentIndex = 1;

  List<Widget> body = [
    MyEventsPage(),
    HomePage(),
    ProfilePage(),
    AddEventPage()
  ];
  List<BottomNavigationBarItem> bottomBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.assignment_turned_in),
      label: "My Events",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: "Add Event",
    ),
  ];
  @override
  void initState() {
    super.initState();
    bool _isAdmin = widget.user?.level == "Club President";
    print(_isAdmin);
    print(widget.user?.level);
    // TODO: change it to event list for the club
    if (_isAdmin)
      bottomBarItems.add(
        const BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Admin"),
      );
    setState(() {});
  }

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
          selectedItemColor: primaryColor,
          unselectedItemColor: darkGreyColor,
          backgroundColor: whiteColor,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
              print(widget.user?.level);
            });
          },
          items: bottomBarItems,
        ),
      ),
    );
  }
}
