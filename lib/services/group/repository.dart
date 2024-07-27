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

  Future<List<Group>> getGroup(String name) async {
    String url = "/group/";

    Map<String, dynamic> data = {
      'name': name,
    };

    Response response = await api.dio.get(url, data: data);
    return (response.data as List).map((e) => Group.fromJson(e)).toList();
  }

  Future<List<Group>> getJoinedGroup() async {
    String url = "/user/group/";
    Response response = await api.dio.get(url);

    return (response.data as List).map((e) => Group.fromJson(e)).toList();
  }
}
