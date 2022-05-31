import 'package:flutter/material.dart';
import 'package:washing_app/src/widgets/background_theme.dart';

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Card(
          margin: const EdgeInsets.only(bottom: 24, left: 32, right: 32),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 22,
              left: 22,
              right: 22,
              bottom: 38,
            ),
            child: Column(
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'username',
                    labelText: 'Username',
                    icon: Icon(Icons.email),
                  ),
                ),
                const Divider(
                  height: 2,
                  indent: 22,
                  endIndent: 22,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Password',
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 220,
          decoration: _boxDecoration(),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.transparent,
            ),
            onPressed: _login,
            child: const Text('เข้าสู่ระบบ'),
          ),
        ),
      ],
    );
  }

  void _login() async {}

  BoxDecoration _boxDecoration() {
    const gradientStart = BackgroundTheme.gradientStart;
    const gradientEnd = BackgroundTheme.gradientEnd;

    final boxShadowItem = (Color color) => BoxShadow(
          color: color,
          offset: Offset(1.0, 6.0),
          blurRadius: 20.0,
        );

    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      boxShadow: <BoxShadow>[
        boxShadowItem(gradientStart),
        boxShadowItem(gradientEnd),
      ],
      gradient: const LinearGradient(
        colors: [
          gradientEnd,
          gradientStart,
        ],
        begin: FractionalOffset(0, 0),
        end: FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
      ),
    );
  }
}