import 'package:flutter/material.dart';
import 'package:washing_app/src/utils/constant.dart';

class TitleCustom extends StatelessWidget {
  final String? title;
  const TitleCustom(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Constant.BLACK_COLOR,
          fontSize: 20,
        ),
      ),
    );
  }
}
