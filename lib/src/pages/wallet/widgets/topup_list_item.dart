import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/models/money_model.dart';
import 'package:washing_app/src/utils/services/format_convert.dart';

class TopUpListItem extends StatefulWidget {
  final Money data;
  String? value;
  TopUpListItem(this.data, {this.value, Key? key}) : super(key: key);

  @override
  State<TopUpListItem> createState() => _TopUpListItemState();
}

class _TopUpListItemState extends State<TopUpListItem> {
  @override
  Widget build(BuildContext context) {
    final Money model = widget.data;
    return ListTile(
      title: Text(
        FormatConvert().numberComma(model.title),
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: model.title == widget.value ? Colors.black38 : Colors.black),
      ),
      leading: Radio(
        value: model.title,
        groupValue: widget.value,
        activeColor: Constant.PRIMARY_COLOR,
        onChanged: (String? value) {
          setState(() {
            widget.value = value;
          });
        },
      ),
    );
  }
}
