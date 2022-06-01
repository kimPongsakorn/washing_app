import 'package:flutter/material.dart';
import 'package:washing_app/src/models/home_model.dart';
import 'package:washing_app/src/pages/home/widgets/washing_list_item.dart';

class WashingList extends StatelessWidget {
  final List<Datum>? _model;
  const WashingList(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      itemBuilder: (context, index) {
        final model = _model![index];
        return WashingListItem(model);
      },
      itemCount: _model?.length,
    );
  }
}
