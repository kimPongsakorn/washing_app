import 'package:flutter/material.dart';
import 'package:washing_app/src/pages/pages.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';
  static const register = 'register';

  final _route = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
  };

  get getAll => _route;
}
