import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/network/api.dart';
import 'package:hajithon_teami_flutter_app/services/auth/service.dart';

class AppLoader {
  Future<void> load() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Get.lazyPut<ApiProvider>(() => ApiProvider());

    // await Hive.initFlutter();
    Get.lazyPut(() => AuthService());

    // FlutterNativeSplash.remove();
  }
}
