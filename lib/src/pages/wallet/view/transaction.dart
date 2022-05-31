import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/constant.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'ประวัติการทำรายการ',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.merge(const TextStyle(fontSize: 20, color: Constant.BG_COLOR)),
        ),
      ],
    );
  }
}
