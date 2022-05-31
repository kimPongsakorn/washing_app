import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:washing_app/src/constants/constant.dart';

class WashingListItem extends StatelessWidget {
  final _model;

  const WashingListItem(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                _model.image,
                height: 60,
              ),
              const SizedBox(width: 5),
              _buildTitleAndStatus(),
              const SizedBox(
                width: 5,
              ),
              Text(
                'ขนาด ${_model.size} kg',
                style: const TextStyle(
                  color: Constant.BLACK_COLOR,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTitleAndStatus() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _model.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Constant.BLACK_COLOR,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          _buildBadge(_model.workingHours),
        ],
      );

  _buildBadge(String? notification) {
    return Badge(
      toAnimate: false,
      shape: BadgeShape.square,
      borderRadius: BorderRadius.circular(8),
      badgeContent: Text(
        notification == null ? 'ว่าง' : 'เหลือเวลา $notification นาที',
        style: const TextStyle(
          color: Constant.BG_WHITE_COLOR,
          fontSize: 14,
        ),
      ),
      badgeColor: notification != null ? Colors.amber : Colors.green,
    );
  }
}
