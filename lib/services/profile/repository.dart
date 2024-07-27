import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hajithon_teami_flutter_app/network/api.dart';
import 'package:hajithon_teami_flutter_app/services/profile/model.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository {
  final ApiProvider api;
  ProfileRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<Profile> getProfile() async {
    String url = "/user/";

    Response response = await api.dio.get(url);
    return Profile.fromJson(response.data);
  }

  Future<Profile> patchProfile({XFile? profileImage, String? nickname, String? description}) async {
    String url = "/user/";

    Map<String, dynamic> data = {};

    if (profileImage != null) {
      data['profile'] = profileImage;
    }

    if (nickname != null) {
      data['nickname'] = nickname;
    }

    if (description != null) {
      data['description'] = description;
    }

    Response response = await api.dio.patch(url, data: data);
    return Profile.fromJson(response.data);
  }

  Future<Profile> getUserByEmail(String email) async {
    String url = '/group/user_list/';

    Map<String, dynamic> data = {
      'email': email,
    };

    Response response = await api.dio.post(url, data: data);
    return Profile.fromJson(response.data);
  }
}
