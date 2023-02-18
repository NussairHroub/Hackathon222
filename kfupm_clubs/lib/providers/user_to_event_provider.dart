import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userToEventProvider = Provider((ref) async {
  return FirebaseFirestore.instance.collection('user_to_event').get();
});
