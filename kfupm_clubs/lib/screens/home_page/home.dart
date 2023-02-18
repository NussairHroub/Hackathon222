import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/models/user.dart';
import 'package:kfupm_clubs/services/database.dart';

import '../../models/club.dart';
import '../../providers/auth_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final clubs = ref.watch(clubsFutureProvider);
    final userData = ref.watch(authStateProvider);
    final users = ref.watch(usersFutureProvider);

    return userData.when(
        data: (user) {
          return clubs.when(
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor)),
            data: (clubsList) {
              List<ClubCard> eventCardsList = [];
              for (Club club in clubsList) {
                eventCardsList.add(ClubCard(
                  club: club,
                ));
              }
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () => {},
                          child: StreamBuilder<List<UserModel>>(
                            stream: DB().users(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }
                              while (snapshot.data!
                                  .where((element) => element.id == user!.uid)
                                  .toList()
                                  .isEmpty) {
                                return const CircularProgressIndicator();
                              }
                              return Text(snapshot.data!
                                  .where((element) => element.id == user!.uid)
                                  .toList()[0]
                                  .name);
                            },
                          )),
                      const Text('search bar')
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
        },
        error: (error, _) => Center(
              child: Text(error.toString()),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class ClubCard extends StatelessWidget {
  const ClubCard({required this.club}) : super();
  final Club club;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          {Navigator.pushNamed(context, '/eventsOfClubPage', arguments: club)},
      child: Container(
        height: 100,
        width: 70,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff7C7C7C)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Column(
              children: [
                Image.network(
                  club.image,
                  height: 140,
                  width: 140,
                ),
              ],
            ),
          ),
          Expanded(
              child: Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Column(
                        children: [
                          Padding(padding: const EdgeInsets.all(7)),
                          Text(
                            club.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xff00210c),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Padding(padding: const EdgeInsets.all(6)),
                          Text(
                            '${club.numberOfEvents} events',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xff7C7C7C),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ))))
        ]),
      ),
    );
  }
}
