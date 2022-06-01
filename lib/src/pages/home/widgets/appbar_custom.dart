import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/asset.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/models/home_model.dart';
import 'package:washing_app/src/utils/services/format_convert.dart';

class AppBarCustom extends StatelessWidget {
  final List<HomeModel> _model;
  const AppBarCustom(this._model, {Key? key}) : super(key: key);

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          _buildStatus(context,
              free: _model.first.free, amount: _model.first.amount),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          _buildCoin(_model.first.coin ?? '0'),
        ],
      ),
    );
  }

  Row _buildCoin(String? coin) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Asset.iconCoin,
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              FormatConvert().decimal(coin),
              style: const TextStyle(
                color: Constant.BG_WHITE_COLOR,
                fontSize: 15,
              ),
            ),
          ),
        ],
      );

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
            const SizedBox(width: 20),
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
}
