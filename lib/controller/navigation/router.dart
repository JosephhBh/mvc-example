import 'package:flutter/material.dart';
import 'package:mvcexample/constants/route_names.dart';
import 'package:mvcexample/root_page.dart';
import 'package:mvcexample/starting_screen.dart';
import 'package:mvcexample/view/single_user_detail.dart';
import 'package:mvcexample/view/users_details_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case kStartingScreenRoute:
      return _fadeRoute(
        settings.name,
        StartingSceen(),
      );
    case kRootPage:
      return _fadeRoute(
        settings.name,
        RootPage(),
      );
    case kUsersDetailsPage:
      return _fadeRoute(
        settings.name,
        UsersDetailsPage(),
      );
    case kSingleUserDetailPage:
      return _fadeRoute(
        settings.name,
        SingleUserDetailPage(),
      );
    default:
      return _errorRoute();
  }
}

Route<dynamic> _fadeRoute(var name, Widget widget) {
  return PageRouteBuilder(
    opaque: true,
    transitionDuration: Duration(milliseconds: 300),
    reverseTransitionDuration: Duration(milliseconds: 300),
    settings: RouteSettings(
      name: name,
    ),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation Error',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error check navigation option',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  });
}
