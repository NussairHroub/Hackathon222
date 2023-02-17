import 'package:flutter/material.dart';
import 'package:kfupm_clubs/screens/event_details_page/event_details_page.dart';
import 'package:kfupm_clubs/screens/home_page/home-stucture.dart';

Route<dynamic> geneateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'homePage':
      return MaterialPageRoute(builder: (context) => HomeStructure());
    case 'eventDetailsPage':
      return MaterialPageRoute(builder: (context) => EventDetailsPage());
    default:
      return MaterialPageRoute(builder: (context) => HomeStructure());
  }
}
