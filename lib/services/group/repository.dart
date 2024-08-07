import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hajithon_teami_flutter_app/network/api.dart';
import 'package:hajithon_teami_flutter_app/services/group/model.dart';
import 'package:hajithon_teami_flutter_app/services/profile/model.dart';

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

  Future<Group> patchGroup(int groupId, {String? name, Time? wakeTime}) async {
    String url = "/group/$groupId/";

    Map<String, dynamic> data = {};

    if (name != null) {
      data['name'] = name;
    }
    if (wakeTime != null) {
      data['wake_time'] = wakeTime.toString();
    }

    Response response = await api.dio.patch(url, data: data);
    return Group.fromJson(response.data);
  }

  Future<List<Profile>> getMemebers() async {
    String url = "/group/user_status/";

    Response response = await api.dio.get(url);
    return (response.data[0]['users'] as List).map((e) => Profile.fromJson(e)).toList();
  }

  Future<Group> inviteMemeber(int groupId, String email) async {
    String url = "/group/$groupId/";

    Map<String, dynamic> data = {
      'email': email,
    };

    Response response = await api.dio.post(url, data: data);
    return Group.fromJson(response.data);
  }

  Future<void> deleteGroup(int id) async {
    String url = '/group/$id/';

    await api.dio.delete(url);
  }
}
