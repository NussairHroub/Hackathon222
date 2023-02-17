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

// yyyy-mm-dd (date format)
Event demoEvent = Event(
    id: '1',
    clubId: '1',
    name: 'Programming Hackathon 2023',
    description: 'about computer',
    image: 'assets/Computer-club.jpg',
    status: 'in register time',
    location: '22-124',
    maxSeats: 20,
    seatsTaken: 13,
    timeCreated: '2023-02-15',
    startTime: '2023-02-30',
    duration: '3 days');


Event demoEvent2 = Event(
    id: '1',
    clubId: '1',
    name: 'Programming Hackathon 202333',
    description: 'hello guys how are you I miss you so much I hopped if I have more time with youdh ',
    image: 'assets/Computer-club.jpg',
    status: 'in register time',
    location: '22-124',
    maxSeats: 20,
    seatsTaken: 13,
    timeCreated: '2023-02-15',
    startTime: '2023-02-18',
    duration: '3 days');