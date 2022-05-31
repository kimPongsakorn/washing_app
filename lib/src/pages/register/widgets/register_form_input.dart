import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washing_app/src/models/register_model.dart';

class RegisterFormInput extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Register register;
  final Function(Register)? voidSubmit;

  const RegisterFormInput(
    this.register, {
    Key? key,
    required this.formKey,
    required this.voidSubmit,
  }) : super(key: key);

  @override
  State<RegisterFormInput> createState() => _RegisterFormInputState();
}

class _RegisterFormInputState extends State<RegisterFormInput> {
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  static const _color = Colors.black54;

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildText(
            'Username',
            focusNode: _emailFocusNode,
            icon: FontAwesomeIcons.envelope,
            onSaved: (String? value) {
              widget.register.username = value;
            },
            onFieldSubmitted: (String value) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'กรุณากรอกชื่อผู้ใช้';
              }
              return null;
            },
          ),
          const Divider(
            height: 2,
            indent: 22,
            endIndent: 22,
          ),
          _buildText(
            'Password',
            focusNode: _passwordFocusNode,
            isPassword: true,
            icon: FontAwesomeIcons.lock,
            onSaved: (String? value) {
              widget.register.password = value;
            },
            onFieldSubmitted: (String value) {
              FocusScope.of(context).requestFocus(_fullNameFocusNode);
            },
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'กรุณากรอกรหัสผ่าน';
              }

              if (value.length < 6) {
                return 'กรุณาใส่รหัสผ่านที่มากกว่า 6 ตัวอักษร';
              }
              return null;
            },
          ),
          const Divider(
            height: 2,
            indent: 22,
            endIndent: 22,
          ),
          _buildText(
            'ชื่อ',
            focusNode: _fullNameFocusNode,
            icon: FontAwesomeIcons.user,
            onSaved: (String? value) {
              widget.register.firstName = value;
            },
            onFieldSubmitted: (String value) {
              FocusScope.of(context).requestFocus(_lastNameFocusNode);
            },
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'กรูณากรอกชื่อ';
              }
              return null;
            },
          ),
          const Divider(
            height: 2,
            indent: 22,
            endIndent: 22,
          ),
          _buildText(
            'นามสกุล',
            focusNode: _lastNameFocusNode,
            icon: FontAwesomeIcons.user,
            onSaved: (String? value) {
              widget.register.lastName = value;
            },
            onEditingComplete: () => widget.voidSubmit!(widget.register),
            validator: (String? value) {
              if (value == null || value.trim().isEmpty) {
                return 'กรุณากรอกนามสกุล';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  TextFormField _buildText(
    String? label, {
    FocusNode? focusNode,
    IconData? icon,
    bool? isPassword,
    Function(String?)? onSaved,
    Function(String)? onFieldSubmitted,
    String? Function(String?)? validator,
    Function()? onEditingComplete,
  }) =>
      TextFormField(
        focusNode: focusNode,
        onSaved: onSaved,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          labelText: label,
          icon: FaIcon(icon),
          suffixIcon: isPassword != null
              ? IconButton(
                  onPressed: _toggleSignup,
                  icon: Icon(
                    _obscureTextPassword
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    size: 15.0,
                    color: _color,
                  ),
                )
              : null,
        ),
        obscureText: isPassword != null ? _obscureTextPassword : false,
      );

  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
