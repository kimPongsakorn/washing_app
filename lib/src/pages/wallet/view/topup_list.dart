import 'package:flutter/material.dart';
import 'package:washing_app/src/models/money_model.dart';
import 'package:washing_app/src/pages/wallet/widgets/topup_list_item.dart';
import 'package:washing_app/src/viewmodels/money_viewmodel.dart';

class TopUpList extends StatefulWidget {
  final String? _value;
  const TopUpList(this._value, {Key? key}) : super(key: key);

  @override
  State<TopUpList> createState() => _TopUpListState();
}

class _TopUpListState extends State<TopUpList> {
  @override
  Widget build(BuildContext context) {
    final value = widget._value;
    return FutureBuilder<List<Money>>(
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
                return TopUpListItem(
                  data,
                  value: value,
                );
              });
        });
  }

  Future<List<Money>> _getMoney() async {
    final List<Money> money = await MonetViewModel().getMoneyItems;
    return money;
  }
}
