import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/providers/auth_provider.dart';
import 'package:kfupm_clubs/screens/wrapper.dart';
import 'package:kfupm_clubs/utils/routers.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authinticate = ref.watch(authStateProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: const Color(0xff007D40))),
      onGenerateRoute: router.geneateRoute,
      home: authinticate.when(
          data: (data) {
            return const Wrapper();
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
          error: (e, stackTrace) => Text(e.toString())),
    );
  }
}
