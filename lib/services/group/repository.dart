import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hajithon_teami_flutter_app/network/api.dart';
import 'package:hajithon_teami_flutter_app/services/group/model.dart';

class GroupRepository {
  final ApiProvider api;
  GroupRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<Group> createGroup(String name, Time wakeTime) async {
    String url = "/group/";

    Map<String, dynamic> data = {
      'name': name,
      'wake_time': wakeTime.toString(),
    };

    Response response = await api.dio.post(url, data: data);
    return Group.fromJson(response.data);
  }
}
