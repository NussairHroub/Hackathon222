import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/services/database.dart';

import '../../models/club.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final clubs = ref.watch(clubsFutureProvider);

    return clubs.when(
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => Center(
          child:
              CircularProgressIndicator(color: Theme.of(context).primaryColor)),
      data: (clubsList) {
        List<ClubCard> eventCardsList = [];
        for (Club club in clubsList) {
          eventCardsList.add(ClubCard(
            clubName: club.name,
          ));
        }
        return Column(
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
                children: eventCardsList,
              ),
            ),
          ],
        );
      },
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class ClubCard extends StatelessWidget {
  const ClubCard({required this.clubName}) : super();
  final String clubName;

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
                child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text(
            clubName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff00210c),
              fontWeight: FontWeight.bold,
            ),
          ),
        )))
      ]),
    );
  }
}
