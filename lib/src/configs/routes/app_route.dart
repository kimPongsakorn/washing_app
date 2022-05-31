import 'package:flutter/material.dart';
import 'package:washing_app/src/pages/pages.dart';

class AppRoute {
  static const home = 'home';

  final _route = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
  };

  get getAll => _route;
}
