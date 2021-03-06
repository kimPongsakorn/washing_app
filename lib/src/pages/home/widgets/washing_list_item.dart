import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:washing_app/src/constants/asset.dart';
import 'package:washing_app/src/constants/constant.dart';
import 'package:washing_app/src/models/home_model.dart';
import 'package:washing_app/src/pages/home/widgets/modal_washing.dart';

class WashingListItem extends StatelessWidget {
  final Datum _model;
  final String? coin;
  const WashingListItem(this._model, {this.coin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showCupertinoModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => ModalWashing(_model),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 8,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  Asset.logoImage,
                  height: 60,
                ),
                const SizedBox(width: 5),
                _buildTitleAndStatus(
                  _model.number,
                  status: _model.status,
                  price: _model.price,
                ),
                const SizedBox(
                  width: 5,
                ),
                _buildSize(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildSize() => Text(
        'ขนาด ${_model.size} kg',
        style: const TextStyle(
          color: Constant.BLACK_COLOR,
          fontSize: 15,
        ),
      );

  Column _buildTitleAndStatus(String? title, {String? status, String? price}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'เครื่องซัก หมายเลข $title',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Constant.BLACK_COLOR,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          _buildBadge(status, price: price),
        ],
      );

  Badge _buildBadge(String? notification, {String? price}) {
    return Badge(
      toAnimate: false,
      shape: BadgeShape.square,
      borderRadius: BorderRadius.circular(8),
      badgeContent: Text(
        notification == '0' ? 'ว่าง ราคา $price บาท' : 'จองแล้ว',
        style: const TextStyle(
          color: Constant.BG_WHITE_COLOR,
          fontSize: 14,
        ),
      ),
      badgeColor: notification != '0' ? Colors.amber : Colors.green,
    );
  }
}
