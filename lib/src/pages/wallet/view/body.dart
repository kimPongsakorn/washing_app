import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/models/coin_model.dart';
import 'package:washing_app/src/pages/wallet/view/modal_topup.dart';
import 'package:washing_app/src/pages/wallet/widgets/header.dart';
import 'package:washing_app/src/utils/services/network_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoinModel>>(
        future: NetworkService().getWallet(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final coinData = snapshot.data;
          if (coinData!.isEmpty) {
            return const Text('empty');
          }
          return RefreshIndicator(
            onRefresh: () async => setState(() {}),
            child: ListView(
              children: [
                Header(coinData.first.coin),
                _buildBtnGetMoney(
                  'เติมเงินเข้ากระเป๋าเงิน',
                  icon: FontAwesomeIcons.circleDollarToSlot,
                  onTap: () => showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const ModalTopUp(),
                  ),
                ),
                const Divider(
                  height: 5,
                  indent: 80,
                ),
              ],
            ),
          );
        });
  }

  ListTile _buildBtnGetMoney(String? title,
          {IconData? icon, Function()? onTap}) =>
      ListTile(
        leading: FaIcon(
          icon,
          color: Constant.PRIMARY_COLOR,
        ),
        onTap: onTap,
        trailing: const FaIcon(
          FontAwesomeIcons.chevronRight,
          color: Constant.PRIMARY_COLOR,
        ),
        title: Text(title ?? ''),
      );
}
