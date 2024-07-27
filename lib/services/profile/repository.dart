import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hajithon_teami_flutter_app/network/api.dart';
import 'package:hajithon_teami_flutter_app/services/profile/model.dart';

class ProfileRepository {
  final ApiProvider api;
  ProfileRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<Profile> getProfile() async {
    String url = "/user/";

    Response response = await api.dio.get(url);
    return Profile.fromJson(response.data);
  }
}
