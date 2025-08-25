import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hsinote/view/home/home.dart';
import 'package:hsinote/view/login/login.dart';
import 'package:hsinote/view/note/note.dart';
import 'package:hsinote/view/register/register.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    final args = (settings.arguments as Map?) ?? {};
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case RegisterPage.routeName:
        return CupertinoPageRoute(
          builder: (_) => const RegisterPage(),
          settings: settings,
        );
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case NotePage.routeName:
        return CupertinoPageRoute(
          builder: (_) => NotePage(note: args['note']),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(child: Text('Page not found :(')),
            );
          },
        );
    }
  }
}
