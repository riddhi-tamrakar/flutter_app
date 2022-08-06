import 'package:dio/dio.dart';

Dio dioProvider() {
  final dio = Dio();
  dio.options.headers["Content-Type"] = "application/json";
  dio.options.validateStatus = (status) {
    return status! < 500;
  };
  return dio;
}
