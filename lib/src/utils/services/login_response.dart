import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.token,
    this.name,
    this.message,
    this.status,
  });

  String? token;
  String? message;
  String? name;
  String? status;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        name: json["name"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "message": message,
        "status": status,
      };
}
