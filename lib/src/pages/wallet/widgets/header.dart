import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          _buildText(
            context,
            title: 'ยอดเงินคงเหลือของคุณ',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.merge(const TextStyle(fontSize: 20)),
          ),
          _buildText(
            context,
            title: '0.00',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.merge(const TextStyle(fontSize: 40)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }

  Text _buildText(context, {String? title, TextStyle? style}) => Text(
        title ?? '',
        style: style,
      );
}
