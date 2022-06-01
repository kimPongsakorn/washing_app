import 'package:flutter/material.dart';
import 'package:washing_app/src/models/home_model.dart';
import 'package:washing_app/src/pages/home/widgets/washing_list_item.dart';

class WashingList extends StatelessWidget {
  final List<Datum>? _model;
  final String? coin;
  const WashingList(this._model, {this.coin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      itemBuilder: (context, index) {
        final model = _model![index];
        return WashingListItem(
          model,
          coin: coin,
        );
      },
      itemCount: _model?.length,
    );
  }
}
