import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String level;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.level});

  factory UserModel.fromQuery(QueryDocumentSnapshot user) {
    return UserModel(
        id: user.id,
        name: user.get('name'),
        email: user.get('email'),
        level: user.get('level'));
  }
}
