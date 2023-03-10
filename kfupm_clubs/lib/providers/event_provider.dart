import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventsProvider = Provider((ref) async {
  return FirebaseFirestore.instance.collection('events').get();
});
