import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hajithon_teami_flutter_app/network/api.dart';
import 'package:hajithon_teami_flutter_app/services/auth/jwt.dart';

class AuthRepository {
  final ApiProvider api;
  AuthRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  ///returns accessToken
  Future<JwtToken> refreshAccessToken(String refreshToken) async {
    String url = "/auth/refresh";

    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $refreshToken',
    };
    Response response = await api.dio.get(url, options: Options(headers: headers));
    return JwtToken(accessToken: response.data['tokens']['accessToken'], refreshToken: response.data['tokens']['refreshToken']);
  }

  Future<JwtToken> login(String email, String password) async {
    String url = '/login/';

    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };

    Response response = await api.dio.post(url, data: data);

    return JwtToken(accessToken: response.data['token']['access'], refreshToken: response.data['token']['refresh']);
  }

  Future<JwtToken> register(String email, String password) async {
    String url = '/register/';

    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };

    Response response = await api.dio.post(url, data: data);

    return JwtToken(accessToken: response.data['token']['access'], refreshToken: response.data['token']['refresh']);
  }
}
