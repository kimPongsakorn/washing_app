import 'package:flutter/material.dart';
import 'package:washing_app/src/pages/home/widgets/appbar_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            AppBarCustom(),
          ],
        ),
      ),
    );
  }
}
