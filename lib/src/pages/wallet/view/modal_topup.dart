import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/models/money_model.dart';
import 'package:washing_app/src/utils/services/format_convert.dart';
import 'package:washing_app/src/utils/services/network_service.dart';
import 'package:washing_app/src/viewmodels/money_viewmodel.dart';
import 'package:washing_app/src/widgets/custom_flushbar.dart';

class ModalTopUp extends StatefulWidget {
  const ModalTopUp({Key? key}) : super(key: key);

  @override
  State<ModalTopUp> createState() => _ModalTopUpState();
}

class _ModalTopUpState extends State<ModalTopUp> {
  String? _group = '10';

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
                    child: _buildSelection(),
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

  FutureBuilder _buildSelection() => FutureBuilder<List<Money>>(
      future: _getMoney(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final money = snapshot.data;
        if (money!.isEmpty) {
          return const Text('empty');
        }
        return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 100),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: money.length,
            itemBuilder: (context, index) {
              final data = money[index];
              return ListTile(
                title: Text(
                  FormatConvert().numberComma(data.title),
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color:
                          data.title == _group ? Colors.black38 : Colors.black),
                ),
                leading: Radio(
                  value: data.title,
                  groupValue: _group,
                  activeColor: Constant.PRIMARY_COLOR,
                  onChanged: (String? value) {
                    setState(() {
                      _group = value!;
                    });
                  },
                ),
              );
            });
      });

  Padding _buildBtnTopUp() => Padding(
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
                  _topUp(_group);
                } else {
                  if (!mounted) return;
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'เติมเงินจำนวน $_group บาท',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );

  Future<List<Money>> _getMoney() async {
    final List<Money> money = MonetViewModel().getMoneyItems;
    return money;
  }

  void _topUp(String? prices) {
    NetworkService().topUp(prices).then((data) async {
      await Future.delayed(const Duration(seconds: 1));
      if (data.status == 'ok') {
        if (!mounted) return;
        Navigator.pop(context);
        CustomFlushbar.showSuccess(context, message: data.message ?? '');
        setState(() {});
        return;
      } else if (data.status == 'error') {
        if (!mounted) return;
        CustomFlushbar.showError(context, message: data.message ?? '');
        return;
      }
    }).catchError((onError) async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      CustomFlushbar.showError(context, message: 'error');
    });
  }

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
