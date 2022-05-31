import 'package:flutter/material.dart';
import 'package:washing_app/src/utils/constant.dart';

ThemeData appTheme() {
  return ThemeData(
    colorScheme: const ColorScheme(
      primary: Constant.PRIMARY_COLOR,
      onPrimary: Constant.PRIMARY_COLOR,
      secondary: Constant.PRIMARY_COLOR,
      surface: Constant.PRIMARY_COLOR,
      onSurface: Constant.PRIMARY_COLOR,
      onSecondary: Constant.PRIMARY_COLOR,
      background: Color(0xFFFFFBFA),
      onBackground: Constant.BG_COLOR,
      brightness: Brightness.light,
      error: Color(0xfff4310a),
      onError: Color(0xFFC5032B),
    ),
    fontFamily: 'Prompt',
    textTheme: TextTheme(
      headline1: const TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline4: const TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: Constant.BG_WHITE_COLOR,
      ),
      headline6: TextStyle(
        fontSize: 32.0,
        color: Constant.BG_WHITE_COLOR.withOpacity(0.5),
      ),
      bodyText2: const TextStyle(fontSize: 14.0, fontFamily: 'Prompt'),
    ),
  );
}
