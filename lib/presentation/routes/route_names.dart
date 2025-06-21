import 'package:flutter/material.dart';

import '../screens/reso_search/repo_detail_screen.dart';
import '../screens/reso_search/repo_search_screen.dart';
import 'route_packages_name.dart';

class RouteNames {

  static const String reposListScreen = '/reposListScreen';
  static const String reposDetailScreen = '/reposDetailScreen';


  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {

        case RouteNames.reposListScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const RepoSearchScreen());

        case RouteNames.reposDetailScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const RepoDetailScreen());


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: FetchErrorText(
                text: 'No Route Found ${settings.name}', textColor: blackColor),
          ),
        );
    }
  }
}
