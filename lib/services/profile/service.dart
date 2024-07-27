import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/profile/model.dart';
import 'package:hajithon_teami_flutter_app/services/profile/repository.dart';

class ProfileService extends GetxController {
  final ProfileRepository repository;

  final Rx<Profile?> _news = Rx(null);
  Profile? get news => _news.value;
  ProfileService({ProfileRepository? repository}) : repository = repository ?? ProfileRepository();

  Future<void> fetchProfile() async {
    _news.value = await repository.getProfile();
  }
}
