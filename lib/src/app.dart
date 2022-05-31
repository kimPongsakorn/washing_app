import 'package:flutter/material.dart';
import 'package:washing_app/src/configs/routes/app_route.dart';
import 'package:washing_app/src/pages/home/home_page.dart';
import 'package:washing_app/src/pages/login/login_page.dart';
import 'package:washing_app/src/themes/app_theme.dart';
import 'package:washing_app/src/utils/services/local_storage_service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute().getAll,
      theme: appTheme(),
      home: _buildHomePage(),
    );
  }

  FutureBuilder<String> _buildHomePage() => FutureBuilder<String>(
        future: LocalStorageService().getToken(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //ตัว snap มีข้อมูลรึยัง
            return Container(
              color: Colors.white,
            );
          }

          final token = snapshot.data;
          // เข้าสู่ระบบ
          if (token!.isEmpty) {
            return const LoginPage();
          }
          // home
          return const HomePage();
        },
      );
}
