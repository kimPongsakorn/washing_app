import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washing_app/src/pages/wallet/view/topup_list.dart';

class ModalTopUp extends StatefulWidget {
  const ModalTopUp({Key? key}) : super(key: key);

  @override
  State<ModalTopUp> createState() => _ModalTopUpState();
}

class _ModalTopUpState extends State<ModalTopUp> {
  final String? _value = '10';
  @override
  Widget build(BuildContext context) {
    return Material(
        child: WillPopScope(
      onWillPop: () => _showCupertinoAlertDialog(),
      child: SafeArea(
        top: false,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildBtnColse(context),
                const Text('เลือกจำนวนเงินที่ต้องการเติม'),
                const SizedBox(height: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TopUpList(_value),
                  ),
                ),
              ],
            ),
            _buildBtnTopUp(),
          ],
        ),
      ),
    ));
  }

  _buildBtnTopUp() => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 220,
            color: Colors.green,
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.transparent,
              ),
              onPressed: () async {
                bool confirms = await _showConfirmTopUpAlertDialog();
                if (confirms) {
                  print(confirms);
                } else {
                  print(confirms);
                }
              },
              child: Text(
                'เติมเงินจำนวน $_value บาท',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
  Future<bool> _showConfirmTopUpAlertDialog() async {
    bool confirm = true;
    await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('ยืนยันการเติมเงิน?'),
              actions: <Widget>[
                CupertinoButton(
                  child: const Text(
                    'ใช่',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    confirm = true;
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoButton(
                  child: const Text(
                    'ยกเลิก',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    confirm = false;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
    return confirm;
  }

  Future<bool> _showCupertinoAlertDialog() async {
    bool shouldClose = true;
    await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('คุณต้องการออกจากหน้านี้?'),
              actions: <Widget>[
                CupertinoButton(
                  child: const Text('ออก'),
                  onPressed: () {
                    shouldClose = true;
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoButton(
                  child: const Text('ยกเลิก'),
                  onPressed: () {
                    shouldClose = false;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
    return shouldClose;
  }

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
