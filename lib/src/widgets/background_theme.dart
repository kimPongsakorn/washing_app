import 'package:flutter/material.dart';

// https://uigradients.com
class BackgroundTheme {
  const BackgroundTheme();

  static const Color gradientStart = Color(0xFF50C9C3);
  static const Color gradientEnd = Color(0xFF96DEDA);

  static const gradient = LinearGradient(
      colors: [gradientStart, gradientEnd],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 1]);
}
