import 'package:flutter/material.dart';
import 'package:washing_app/src/configs/routes/app_route.dart';
import 'package:washing_app/src/constants/asset.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/pages/login/widgets/form.dart' as login;
import 'package:washing_app/src/widgets/background_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: BackgroundTheme.gradient,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                Image.asset(
                  Asset.logoImage,
                  height: 120,
                ),
                const SizedBox(height: 32),
                const login.Form(),
                const SizedBox(height: 32),
                _buildTextButton(
                  Constant.MENU_REGISTER,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoute.register,
                      arguments: {
                        'title': Constant.MENU_REGISTER,
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextButton _buildTextButton(String text, {VoidCallback? onPressed}) =>
      TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
}
