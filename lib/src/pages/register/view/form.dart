import 'dart:async';

import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/models/register_model.dart';
import 'package:washing_app/src/pages/register/widgets/register_form_input.dart';
import 'package:washing_app/src/utils/services/network_service.dart';
import 'package:washing_app/src/widgets/background_theme.dart';
import 'package:washing_app/src/widgets/custom_flushbar.dart';

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  final _form = GlobalKey<FormState>();

  final _register = Register();

  final StreamController<bool> _loadingController = StreamController();

  @override
  void dispose() {
    _loadingController.close();
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
                Text(
                  (ModalRoute.of(context)!.settings.arguments
                          as Map)['title'] ??
                      '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Constant.BLACK_COLOR,
                    fontSize: 20,
                  ),
                ),
                RegisterFormInput(
                  _register,
                  formKey: _form,
                  voidSubmit: (data) => _submitForm(data),
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
            onPressed: () => _submitForm(_register),
            child: const Text('เข้าสู่ระบบ'),
          ),
        ),
      ],
    );
  }

  void _submitForm(Register register) async {
    FocusScope.of(context).requestFocus(FocusNode());
    _form.currentState?.save();
    if (!(_form.currentState?.validate() ?? true)) {
      return;
    }

    try {
      CustomFlushbar.showLoading(context);
      String? result;
      result = await NetworkService().register(register);

      if (!mounted) return;
      CustomFlushbar.close(context);

      if (result == '201') {
        // Navigator.pushReplacementNamed(
        //   context,
        //   Constant.LOGIN_ROUTE,
        // );
        if (!mounted) return;
        CustomFlushbar.showSuccess(context, message: 'สมัครสมาชิกสำเร็จ');
        return;
      }
      if (result == '200') {
        if (!mounted) return;
        CustomFlushbar.showError(context,
            message: 'username นี้มีการใช้งานแล้ว');
        return;
      }
    } catch (exception) {
      CustomFlushbar.showError(context, message: '$exception');
    }
  }

  StreamBuilder _buildLoading() => StreamBuilder<bool>(
        initialData: false,
        stream: _loadingController.stream,
        builder: (context, snapshot) => !snapshot.data!
            ? const SizedBox()
            : Positioned(
                top: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: LinearProgressIndicator(
                      minHeight: 5,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF0EDED2)),
                      backgroundColor: Color(0xFF03A0FE),
                    ),
                  ),
                ),
              ),
      );

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
