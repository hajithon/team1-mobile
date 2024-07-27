import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/profile/model.dart';
import 'package:hajithon_teami_flutter_app/services/profile/repository.dart';
import 'package:image_picker/image_picker.dart';

class ProfileService extends GetxController {
  final ProfileRepository repository;

  final Rx<Profile?> _profile = Rx(null);
  Profile? get profile => _profile.value;
  ProfileService({ProfileRepository? repository}) : repository = repository ?? ProfileRepository();

  Future<void> fetchProfile() async {
    _profile.value = await repository.getProfile();
  }

  Future<void> patchProfile({XFile? profileImage, String? nickname, String? description}) async {
    _profile.value = await repository.patchProfile(profileImage: profileImage, nickname: nickname, description: description);
  }
}
