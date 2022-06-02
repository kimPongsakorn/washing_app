// To parse this JSON data, do
//
//     final coinModel = coinModelFromJson(jsonString);

import 'dart:convert';

List<CoinModel> coinModelFromJson(String str) =>
    List<CoinModel>.from(json.decode(str).map((x) => CoinModel.fromJson(x)));

String coinModelToJson(List<CoinModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoinModel {
  CoinModel({
    this.coin,
  });

  String? coin;

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        coin: json["coin"],
      );

  Map<String, dynamic> toJson() => {
        "coin": coin,
      };
}
