import 'package:flutter/material.dart';
import 'package:mvvm/Utils/Routes/routes_name.dart';
import 'package:mvvm/View/home_view.dart';
import 'package:mvvm/View/login_view.dart';

class Routes {
  static Route<dynamic> genarateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Column(
              children: [
                Text('no route defined '),
              ],
            ),
          );
        });
    }
  }
}
