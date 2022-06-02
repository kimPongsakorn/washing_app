import 'package:flutter/material.dart';
import 'package:washing_app/src/models/money_model.dart';

class CustomRadio extends StatelessWidget {
  final Money _data;

  CustomRadio(this._data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: _data.isSelected ? const Color(0xFF3B4257) : Colors.white,
        child: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                _data.title,
                style: TextStyle(
                    color: _data.isSelected ? Colors.white : Colors.grey),
              ),
            ],
          ),
        ));
  }
}
