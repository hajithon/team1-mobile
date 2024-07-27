import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/profile/model.dart';
import 'package:hajithon_teami_flutter_app/services/profile/repository.dart';
import 'package:image_picker/image_picker.dart';

class ProfileService extends GetxController {
  final ProfileRepository repository;

  final Rx<Profile?> _profile = Rx(null);
  Profile? get profile => _profile.value;

  final Rx<List<Wake>> _wakes = Rx([]);
  List<Wake> get wakes => _wakes.value;

  ProfileService({ProfileRepository? repository}) : repository = repository ?? ProfileRepository();

  Future<void> fetchProfile() async {
    _profile.value = await repository.getProfile();
  }

  Future<void> fetchWakes() async {
    _wakes.value = await repository.getWakesByMonth(DateTime.now().month);
  }

  Wake? getWakeByDay(int year, int month, int day) {
    return wakes.firstWhereOrNull(
      (wake) => wake.wakeTime.year == year && wake.wakeTime.month == month && wake.wakeTime.day == day,
    );
  }

  List<Wake?> getWeaklyWakes() {
    DateTime now = DateTime.now();
    int weekday = now.weekday % 7;
    List<Wake?> res = [];
    for (int i = 0; i < 7; i++) {
      res.add(getWakeByDay(now.year, now.month, now.day - weekday + i));
    }
    return res;
  }

  Future<void> patchProfile({XFile? profileImage, String? nickname, String? description}) async {
    _profile.value = await repository.patchProfile(profileImage: profileImage, nickname: nickname, description: description);
  }

  Future<Profile> searchUserByEmail(String email) async {
    return await repository.getUserByEmail(email);
  }
}
