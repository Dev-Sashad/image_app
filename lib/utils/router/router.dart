import 'package:flutter/material.dart';
import 'package:image_app/ui/screens/full_view/full_view.dart';
import 'package:image_app/ui/screens/home/home_view.dart';
import 'package:image_app/utils/router/routeNames.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {  

     case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Home(),
      );

      case FullViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: FullView(),
      );
 

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

// ignore: unused_element
PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
