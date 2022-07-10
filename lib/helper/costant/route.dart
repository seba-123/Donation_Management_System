import 'package:dms_app/model/route_argument.dart';
import 'package:flutter/material.dart';
import '../../UI/view/events_screen/check_event_screen.dart';
import '../../UI/view/events_screen/event_screen.dart';
import '../../UI/view/login_screen/login_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case LoginScreen.route:
        return MaterialPageRoute(builder: (_) => LoginScreen());

        case EventScreen.route:
        return MaterialPageRoute(builder: (_) => EventScreen());

           default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
