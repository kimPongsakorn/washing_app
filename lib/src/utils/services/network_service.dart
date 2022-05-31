import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:washing_app/src/constants/network_api.dart';
import 'package:washing_app/src/models/register_model.dart';

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
}
