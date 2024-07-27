import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/profile/service.dart';

class OnboardingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileService());
  }
}
