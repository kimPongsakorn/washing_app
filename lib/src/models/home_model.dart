// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

List<HomeModel> homeModelFromJson(String str) =>
    List<HomeModel>.from(json.decode(str).map((x) => HomeModel.fromJson(x)));

String homeModelToJson(List<HomeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeModel {
  HomeModel({
    this.coin,
    this.free,
    this.amount,
    this.data,
  });

  String? coin;
  String? free;
  String? amount;
  List<Datum>? data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        coin: json["coin"],
        free: json["free"],
        amount: json["amount"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coin": coin,
        "free": free,
        "amount": amount,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.number,
    this.size,
    this.idUser,
    this.status,
    this.price,
  });

  String? id;
  String? number;
  String? size;
  String? idUser;
  String? status;
  String? price;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        number: json["number"],
        size: json["size"],
        idUser: json["id_user"] == null ? null : json["id_user"],
        status: json["status"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "size": size,
        "id_user": idUser == null ? null : idUser,
        "status": status,
        "price": price,
      };
}
