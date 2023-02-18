import 'package:cloud_firestore/cloud_firestore.dart';

class Club {
  final String id;
  final String name;
  final String description;
  final int numberOfEvents;
  final String image;

  factory Club.fromQuery(QueryDocumentSnapshot club) {
    return Club(
      id: club.id,
      name: club.get('name'),
      description: club.get('description'),
      numberOfEvents: club.get('numberOfEvents'),
      image: club.get('image'),
    );
  }

  Club(
      {required this.id,
      required this.name,
      required this.description,
      required this.numberOfEvents,
      required this.image});
}
