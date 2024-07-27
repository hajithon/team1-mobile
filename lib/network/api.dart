import 'package:dio/dio.dart';

class ApiProvider {
  final baseUrl = 'https://2bzksr2k-8000.asse.devtunnels.ms/';
  final Dio dio = Dio();
  ApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(LogInterceptor());
  }
}
