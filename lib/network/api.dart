import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:hajithon_teami_flutter_app/network/interceptors/jwt.dart';
import 'package:hajithon_teami_flutter_app/network/interceptors/log.dart';

class ApiProvider {
  final baseUrl = 'https://2bzksr2k-8000.asse.devtunnels.ms/';
  final Dio dio = Dio();
  ApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(JWTInterceptor(dio));
    dio.interceptors.add(LogInterceptor());
  }
}
