import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/asset.dart';
import 'package:washing_app/src/utils/constant.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _buildTitle('เครื่องซักผ้า'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            _buildStatus(context, free: '2', amount: '5'),
          ],
        ),
      ),
    );
  }

  Center _buildStatus(BuildContext context, {String? free, String? amount}) =>
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Asset.logoImage,
              height: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: free ?? '0',
                    style: Theme.of(context).textTheme.headline4,
                    children: <TextSpan>[
                      TextSpan(
                        text: '/${amount ?? 0}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Text(
                  'เครื่องว่าง',
                  style: Theme.of(context).textTheme.headline6?.merge(
                        const TextStyle(fontSize: 20),
                      ),
                ),
              ],
            ),
          ],
        ),
      );

  Text _buildTitle(String? title) => Text(
        title ?? '',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Constant.BLACK_COLOR,
          fontSize: 20,
        ),
      );
}
