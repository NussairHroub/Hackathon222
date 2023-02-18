import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/services/auth.dart';

import '../models/auth_user_model.dart';

final authProvider = Provider<Auth>((ref) {
  return Auth();
});

final authStateProvider = StreamProvider.autoDispose<AuthUserModel?>((ref) {
  return ref.watch(authProvider).user;
});
