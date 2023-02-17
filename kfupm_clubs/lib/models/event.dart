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

  Event(
      {required this.id,
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
