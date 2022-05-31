import 'package:flutter/material.dart';
import 'package:washing_app/src/pages/pages.dart';
import 'package:washing_app/src/pages/wallet/view/transaction.dart';
import 'package:washing_app/src/pages/wallet/wallet_page.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';
  static const register = 'register';
  static const wallet = 'wallet';
  static const transaction = 'transaction';

  final _route = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    wallet: (context) => const WalletPage(),
    transaction: (context) => const Transaction(),
  };

  get getAll => _route;
}
