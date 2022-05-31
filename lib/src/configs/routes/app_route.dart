import 'package:flutter/material.dart';
import 'package:washing_app/src/pages/pages.dart';
import 'package:washing_app/src/pages/wallet/wallet_page.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';
  static const register = 'register';
  static const wallet = 'wallet';

  final _route = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    wallet: (context) => const WalletPage(),
  };

  get getAll => _route;
}
