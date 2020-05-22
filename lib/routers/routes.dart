import 'package:flutter/material.dart';
import 'package:food/dashboard.dart';
import 'package:food/modules/auth/ui/login_signup_ui.dart';
import 'package:food/settings.dart';

typedef void RouteCallback(BuildContext context);

class RouteItem {
  RouteItem({
    @required this.title,
    @required this.subtitle,
    @required this.push,
  });

  final String title;
  final String subtitle;
  final RouteCallback push;
}

Route onGenerateRoute(RouteSettings settings){
  switch (settings.name){
    case 'auth.login':
      return MaterialPageRoute(builder: (context) => LoginSignupPage());
    case 'dashboard':
      return MaterialPageRoute(builder: (context) => Dashboard());
    case 'settings':
      return MaterialPageRoute(builder: (context) => Settings());
    default:
      return MaterialPageRoute(
        builder: (context) => Container(),
        settings: settings,
      );
  }
}