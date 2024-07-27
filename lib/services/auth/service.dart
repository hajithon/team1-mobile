import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/pages/login/landing_screen.dart';
import 'package:hajithon_teami_flutter_app/services/auth/jwt.dart';
import 'package:hajithon_teami_flutter_app/services/auth/repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService extends GetxController {
  final AuthRepository repository;
  late final JwtManager jwt;
  AuthService({AuthRepository? repository}) : repository = repository ?? AuthRepository();

  bool get isLoggedIn => jwt.token.accessToken != null;

  Completer _refreshTokenApiCompleter = Completer()..complete();

  Future<AuthService> init() async {
    jwt = await JwtManager().init();

    return this;
  }

  Future<void> login(String email, String password) async {
    final newToken = await repository.login(email, password);
    await jwt.setToken(newToken);
  }

  Future<void> register(String email, String password) async {
    final newToken = await repository.register(email, password);
    await jwt.setToken(newToken);
  }

  ///Throws exception and route to LoginPage if refresh faild
  Future<void> refreshAcessToken() async {
    // refreshTokenApi의 동시 다발적인 호출을 방지하기 위해 completer를 사용함. 동시 다발적으로 이 함수를 호출해도 api는 1번만 호출 됨.
    if (_refreshTokenApiCompleter.isCompleted == false) {
      return _refreshTokenApiCompleter.future;
    }

    //첫 호출(null)이거나 이미 완료된 호출(completed completer)일 경우 새 객체 할당
    _refreshTokenApiCompleter = Completer();
    try {
      JwtToken newJwt = await repository.refreshAccessToken(jwt.token.refreshToken!);
      if (jwt.token.refreshToken == null) {
        throw Exception();
      }
      log('token refreshed!');
      log('accessToken expires at ${JwtDecoder.getExpirationDate(newJwt.accessToken!)}');
      log('refreshToken expires at ${JwtDecoder.getExpirationDate(newJwt.refreshToken!)}');
      await jwt.setToken(newJwt);
      _refreshTokenApiCompleter.complete();
    } catch (e) {
      await logout();
      Get.offAllNamed(LandingScreen.routeName);
      _refreshTokenApiCompleter.completeError(e);
      rethrow;
    }
  }

  Future<void> _clearTokens() async {
    await jwt.clear();
    // await Get.find<PushService>().deleteToken();
  }

  Future<void> logout() async {
    await _clearTokens();
  }
}
