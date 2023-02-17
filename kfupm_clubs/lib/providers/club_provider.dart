import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

final clubsProvider = Provider((ref) async {
  return FirebaseFirestore.instance.collection('clubs').get();
});
