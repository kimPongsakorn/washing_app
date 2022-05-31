import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/pages/wallet/widgets/header.dart';
import 'package:washing_app/src/widgets/drawer.dart';
import 'package:washing_app/src/widgets/title_custom.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const TitleCustom('กระเป๋าเงินของคุณ'),
        elevation: 0,
        iconTheme: const IconThemeData(color: Constant.BG_WHITE_COLOR),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            _buildBtnGetMoney(
              'เติมเงินเข้ากระเป๋าเงิน',
              icon: FontAwesomeIcons.circleDollarToSlot,
            ),
            const Divider(
              height: 5,
              indent: 80,
            ),
            _buildBtnGetMoney(
              'ประวัติการทำรายการ',
              icon: FontAwesomeIcons.rectangleList,
            ),
            const Divider(
              height: 5,
              indent: 80,
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildBtnGetMoney(String? title, {IconData? icon}) => ListTile(
        leading: FaIcon(
          icon,
          color: Constant.PRIMARY_COLOR,
        ),
        trailing: const FaIcon(
          FontAwesomeIcons.chevronRight,
          color: Constant.PRIMARY_COLOR,
        ),
        title: Text(title ?? ''),
      );
}
