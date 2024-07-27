import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/news/service.dart';
import 'package:hajithon_teami_flutter_app/services/todo/service.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsService());
    Get.lazyPut(() => TodoService());
  }
}
