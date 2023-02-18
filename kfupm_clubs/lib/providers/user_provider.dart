import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersProvider = Provider((ref) async {
  return FirebaseFirestore.instance.collection('users').get();
});
