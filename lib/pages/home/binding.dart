import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/group/service.dart';
import 'package:hajithon_teami_flutter_app/services/news/service.dart';
import 'package:hajithon_teami_flutter_app/services/profile/service.dart';
import 'package:hajithon_teami_flutter_app/services/todo/service.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsService());
    Get.lazyPut(() => TodoService());
    Get.lazyPut(() => GroupService());
    Get.lazyPut(() => ProfileService());
  }
}
