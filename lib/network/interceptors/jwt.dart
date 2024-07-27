import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hajithon_teami_flutter_app/services/auth/service.dart';

class JWTInterceptor extends Interceptor {
  final Dio _dioInstance;

  // Dependency Injection
  JWTInterceptor(this._dioInstance);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AuthService authService = Get.find<AuthService>();

    options.headers['Authorization'] ??= 'Bearer ${authService.jwt.token.accessToken}';

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    AuthService authService = Get.find<AuthService>();
    //refresh api가 401시 무한 루프 방지

    if (err.response == null || err.response?.requestOptions.path == '/auth/refresh') {
      return handler.next(err);
    }

    Response httpResponse = err.response!;

    if (httpResponse.statusCode == 403) {
      try {
        await authService.refreshAcessToken();

        //api 호출을 다시 시도함
        err.requestOptions.headers['Authorization'] = null;
        final Response response = await _dioInstance.fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        //refresh 실패 시 401을 그대로 반환
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}
