import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/screens/home_page/home-stucture.dart';
import 'package:kfupm_clubs/screens/home_page/home.dart';

import '../providers/auth_provider.dart';
import 'login_page/login_page.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
        data: (data) {
          if (data != null) {
            return HomeStructure();
          }
          return const LoginPage();
        },
        error: (error, stack) => Scaffold(
              body: Center(
                child: Text(error.toString()),
              ),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
