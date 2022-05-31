import 'package:flutter/material.dart';
import 'package:washing_app/src/models/mashing_model.dart';
import 'package:washing_app/src/pages/home/widgets/washing_list_item.dart';
import 'package:washing_app/src/viewmodels/status_washing_viewmodel.dart';

class WashingList extends StatelessWidget {
  const WashingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MashingModel> list = StatusWashingViewModel().getWashingItems;
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      itemBuilder: (context, index) {
        final model = list[index];
        return WashingListItem(model);
      },
      itemCount: list.length,
    );
  }
}
