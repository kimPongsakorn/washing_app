import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/pages/home/view/washing_list.dart';
import 'package:washing_app/src/pages/home/widgets/appbar_custom.dart';
import 'package:washing_app/src/widgets/modal_fit.dart';
import 'package:washing_app/src/widgets/title_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AppBarCustom(),
            SizedBox(height: 10),
            TitleCustom('เครื่องว่าง'),
            Expanded(child: WashingList()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildFloatingActionButton(
        context,
        title: 'คิวอาร์โค้ดไลน์กลุ่ม',
        iconData: Icons.qr_code,
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context,
          {String? title, required IconData? iconData}) =>
      FloatingActionButton.extended(
        onPressed: () => showCupertinoModalBottomSheet(
          expand: false,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => const ModalFit(),
        ),
        label: Text(
          title ?? '',
          style: const TextStyle(
            color: Constant.BG_WHITE_COLOR,
            fontSize: 15,
          ),
        ),
        icon: Icon(iconData, color: Constant.BG_WHITE_COLOR),
        // backgroundColor: Colors.pink,
      );
}
