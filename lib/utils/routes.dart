import 'package:appandup_take_home/ui/screens/screens.dart';
import 'package:appandup_take_home/ui/screens/search_results_page.dart';
import 'package:appandup_take_home/utils/constants.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutingConstants.HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case RoutingConstants.AuthPageRoute:
      return MaterialPageRoute(builder: (context) => AuthPage());
    case RoutingConstants.SignUpROute:
      return MaterialPageRoute(builder: (context) => SignUpPage());
    case RoutingConstants.SearchResultsRoute:
      return MaterialPageRoute(builder: (context) => SearchResultsPage());

    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
