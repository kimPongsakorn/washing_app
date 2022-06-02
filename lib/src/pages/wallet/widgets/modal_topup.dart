import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/models/money_model.dart';
import 'package:washing_app/src/pages/wallet/widgets/custom_radio.dart';
import 'package:washing_app/src/viewmodels/money_viewmodel.dart';

class ModalTopUp extends StatefulWidget {
  const ModalTopUp({Key? key}) : super(key: key);

  @override
  State<ModalTopUp> createState() => _ModalTopUpState();
}

class _ModalTopUpState extends State<ModalTopUp> {
  @override
  Widget build(BuildContext context) {
    final List<Money> money = MonetViewModel().getMoneyItems;
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildBtnColse(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 80,
                    // childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: money.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      splashColor: Constant.PRIMARY_COLOR,
                      onTap: () => _incrementCounter(money, index: index),
                      child: CustomRadio(money[index]),
                    );
                  }),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> _incrementCounter(List<Money> data, {int? index}) async {
    setState(() {});
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
