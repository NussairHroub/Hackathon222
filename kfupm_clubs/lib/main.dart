import 'package:flutter/material.dart';
import 'package:kfupm_clubs/screens/home_page/home-stucture.dart';
import 'package:kfupm_clubs/screens/home_page/home.dart';
import 'package:kfupm_clubs/utils/routers.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: const Color(0xff007D40))),
      initialRoute: '/',
      onGenerateRoute: router.geneateRoute,
    );
  }
}
