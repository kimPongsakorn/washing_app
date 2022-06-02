import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washing_app/src/constants/network_api.dart';
import 'package:washing_app/src/models/coin_model.dart';
import 'package:washing_app/src/models/home_model.dart';
import 'package:washing_app/src/models/message_model.dart';
import 'package:washing_app/src/models/register_model.dart';
import 'package:washing_app/src/utils/services/login_response.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;

  static final Dio _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.baseUrl = NetworkAPI.baseURL;
          if (kDebugMode) {
            print(options.baseUrl + options.path);
          }
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          // await Future.delayed(Duration(seconds: 2));

          return handler.next(response);
        },
        onError: (DioError e, handler) {
          switch (e.response?.statusCode) {
            case 301:
              break;
            case 401:
              break;
            default:
          }
          return handler.next(e);
        },
      ),
    );

  static final Dio _dioLine = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) async {
          requestOptions.baseUrl = NetworkAPI.baseLineURL;
          const makeToken = 'dhdDm4uKzKEklX0KKBNL8aQADCBXVMZrprMeB0kTN9J';
          requestOptions.headers['Authorization'] = 'Bearer $makeToken';

          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          // await Future.delayed(Duration(seconds: 2));

          return handler.next(response);
        },
        onError: (DioError e, handler) {
          switch (e.response?.statusCode) {
            case 301:
              break;
            case 401:
              break;
            default:
          }
          return handler.next(e);
        },
      ),
    );

  Future<String?> setNotifyLine(String? message) async {
    FormData data = FormData.fromMap({'message': message});

    final response = await _dioLine.post(NetworkAPI.notify, data: data);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.statusCode.toString();
    }
    throw Exception();
  }

  Future<String?> register(Register? register) async {
    FormData data = FormData.fromMap({
      'name': register!.firstName,
      'lastname': register.lastName,
      'username': register.username,
      'password': register.password,
    });

    final response = await _dio.post(NetworkAPI.register, data: data);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.statusCode.toString();
    }
    throw Exception();
  }

  Future<MessageModel> cancel(final String prices, final String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('token');
    int idUser = int.parse(value!);

    FormData data = FormData.fromMap({
      'prices': prices,
      'id': id,
      'id_user': idUser,
    });

    final response = await _dio.post(NetworkAPI.cancel, data: data);
    if (response.statusCode == 200) {
      return messageModelFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }

  Future<MessageModel> payment(final String prices, final String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('token');
    int idUser = int.parse(value!);

    FormData data = FormData.fromMap({
      'prices': prices,
      'id': id,
      'id_user': idUser,
    });

    final response = await _dio.post(NetworkAPI.payment, data: data);
    if (response.statusCode == 200) {
      return messageModelFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }

  Future<LoginResponse> login(
      final String username, final String password) async {
    FormData data = FormData.fromMap({
      'username': username,
      'password': password,
    });
    final response = await _dio.post(
      NetworkAPI.login,
      data: data,
    );
    if (kDebugMode) {
      print(response.statusCode);
      print(response.data);
      print(response.data['token']);
    }
    LoginResponse login = loginResponseFromJson(jsonEncode(response.data));
    if (kDebugMode) {
      print(login.token);
    }
    return loginResponseFromJson(jsonEncode(response.data));
  }

  Future<List<HomeModel>> getHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('token');
    int id = int.parse(value!);

    FormData data = FormData.fromMap({
      'id': id,
    });

    final response = await _dio.post(NetworkAPI.home, data: data);
    if (response.statusCode == 200) {
      return homeModelFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }

  Future<List<CoinModel>> getWallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('token');
    int id = int.parse(value!);

    FormData data = FormData.fromMap({
      'id': id,
    });

    final response = await _dio.post(NetworkAPI.getCoin, data: data);
    if (response.statusCode == 200) {
      return coinModelFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }

  Future<MessageModel> topUp(String? prices) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('token');
    int id = int.parse(value!);

    FormData data = FormData.fromMap({
      'prices': prices,
      'id_user': id,
    });

    final response = await _dio.post(NetworkAPI.topUp, data: data);
    if (response.statusCode == 200) {
      return messageModelFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }
}
