import 'package:flutter/material.dart';
import 'package:washing_app/src/configs/routes/app_route.dart';
import 'package:washing_app/src/pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute().getAll,
      home: const HomePage(),
    );
  }
}