import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String clubId;
  final String name;
  final String description;
  final String image;
  final String status;
  final String location;
  final int maxSeats;
  final int seatsTaken;
  final String timeCreated;
  final String startTime;
  final String duration;

  factory Event.fromQuery(QueryDocumentSnapshot event) {
    return Event(
      id: event.id,
      clubId: event.get('clubId'),
      name: event.get('name'),
      description: event.get('description'),
      image: event.get('image'),
      status: event.get('status'),
      location: event.get('location'),
      maxSeats: event.get('maxSeats'),
      seatsTaken: event.get('seatsTaken'),
      timeCreated: event.get('timeCreated'),
      startTime: event.get('time'),
      duration: event.get('duration')
    );
  }

  Event({
    required this.id,
    required this.clubId,
    required this.name,
    required this.description,
    required this.image,
    required this.status,
    required this.location,
    required this.maxSeats,
    required this.seatsTaken,
    required this.timeCreated,
    required this.startTime,
    required this.duration,
  });
}
