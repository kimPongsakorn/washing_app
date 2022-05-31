import 'package:flutter/material.dart';
import 'package:washing_app/src/pages/register/view/form.dart' as register;
import 'package:washing_app/src/widgets/background_theme.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: BackgroundTheme.gradient,
              ),
            ),
            _buildBtnColse(context),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  const register.Form(),
                  const SizedBox(height: 32),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            _buildBtnColse(context),
          ],
        ),
      ),
    );
  }

  Align _buildBtnColse(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 35,
          icon: const Icon(Icons.close_rounded),
        ),
      );
}
