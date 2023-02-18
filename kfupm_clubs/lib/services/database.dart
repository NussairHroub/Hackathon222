import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/providers/user_to_event_provider.dart';

import '../models/club.dart';
import '../models/event.dart';

import '../models/user.dart';
import '../providers/auth_provider.dart';
import '../providers/event_provider.dart';
import '../providers/club_provider.dart';
import '../providers/user_provider.dart';

final eventsFutureProvider = FutureProvider.autoDispose<List<Event>>(
  (ref) async {
    final events = await ref.watch(eventsProvider);
    return events.docs.map((e) => Event.fromQuery(e)).toList();
  },
);

final clubsFutureProvider = FutureProvider.autoDispose<List<Club>>(
  (ref) async {
    final clubs = await ref.watch(clubsProvider);
    return clubs.docs.map((e) => Club.fromQuery(e)).toList();
  },
);

final usersFutureProvider = FutureProvider.autoDispose<List<UserModel>>(
  (ref) async {
    final users = await ref.watch(usersProvider);
    return users.docs.map((e) => UserModel.fromQuery(e)).toList();
  },
);

final userToEventFutureProvider = FutureProvider.autoDispose<List<Event>>(
  (ref) async {
    final userToEventCollection = await ref.watch(userToEventProvider);
    final auth = ref.watch(authStateProvider);
    final eventsCollection =
        await FirebaseFirestore.instance.collection('events').get();

    final eventsOfUser = userToEventCollection.docs
        .where((element) => element.get('userId') == auth.value!.uid)
        .toList();

    List<Event> eventsOfUserList = [];
    for (var junDoc in eventsOfUser) {
      for (var eventDoc in eventsCollection.docs) {
        if (junDoc.get('eventId').toString().trim() ==
            eventDoc.id.toString().trim()) {
          eventsOfUserList.add(Event.fromQuery(eventDoc));
        }
      }
    }

    // final eventsOfUser = userToEventCollection.docs
    //     .map((userToEventDoc) => userToEventDoc.get('eventId'))
    //     .map((registerdEventId) => eventsCollection.docs
    //         .where((element) => element.id == registerdEventId)
    //         .toList())
    //     .toList();
    // log(eventsOfUser
    //     .map((e) => e.map((e) => Event.fromQuery(e)).toList())
    //     .toList()
    //     .expand((element) => element)
    //     .toList()
    //     .first
    //     .toString());

    return eventsOfUserList;
  },
);

class DB {
  final _firebase = FirebaseFirestore.instance;

  Future<void> addUser(
      {required String name,
      required String email,
      required String level,
      required String clubId,
      required String studentId,
      required String uid}) async {
    final usersCollection = _firebase.collection('users');

    await usersCollection.doc(uid).set({
      'name': name,
      'email': email,
      'level': level,
      'studentId': studentId,
    });
  }

  Future<void> addEvent(
      {required String name,
      required String clubId,
      required int maxSeats,
      required String path,
      required DateTime registrationDueDate,
      required DateTime eventStart,
      required String duration,
      required String location,
      required String description}) async {
    final eventsCollection = _firebase.collection('events');

    await eventsCollection.add({
      'name': name,
      'club_id': clubId,
      'description': description,
      'duration': duration,
      'image': path,
      'location': location,
      'maxSeats': maxSeats,
      'registrationEnd': registrationDueDate.toString(),
      'seatsTaken': 0,
      'status': 'In register time',
      'time': eventStart.toString(),
      'timeCreated': DateTime.now()
    });
  }

  Future<void> registerToEvent(
      {required String userId, required String eventId}) async {
    log(userId);
    final userToEventCollection = _firebase.collection('user_to_event');
    await userToEventCollection.add({
      'userId': userId,
      'eventId': eventId,
    });
  }

  Stream<List<UserModel>> users() {
    final usersCollection = _firebase.collection('users');

    return usersCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserModel.fromQuery(doc)).toList();
    });
  }
}
