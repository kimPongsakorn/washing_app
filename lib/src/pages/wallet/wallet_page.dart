import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/widgets/drawer.dart';
import 'package:washing_app/src/widgets/title_custom.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const TitleCustom('เครื่องซักผ้า'),
        elevation: 0,
        iconTheme: const IconThemeData(color: Constant.BG_WHITE_COLOR),
        centerTitle: false,
      ),
    );
  }
}
