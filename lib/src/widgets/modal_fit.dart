import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/asset.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildBtnColse(context),
          const SizedBox(height: 50),
          _buildQRGroup(context),
          const SizedBox(height: 10),
          const Text('ใช้คิวอาร์โค้ดเข้ากลุ่ม เพื่อรับการแจ้งเตือ'),
          const SizedBox(height: 50)
        ],
      ),
    ));
  }

  _buildQRGroup(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
          ),
        ),
        child: Image.asset(Asset.qrGroupImage,
            height: MediaQuery.of(context).size.height * 0.30),
      );

  Align _buildBtnColse(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 35,
          icon: const Icon(Icons.close_rounded),
        ),
      );
}
