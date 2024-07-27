import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/group/model.dart';
import 'package:hajithon_teami_flutter_app/services/group/repository.dart';

class GroupService extends GetxController {
  final Rx<List<Group>?> _joinedGroups = Rx(null);
  List<Group>? get joinedGroups => _joinedGroups.value;
  final GroupRepository repository;

  GroupService({GroupRepository? repository}) : repository = repository ?? GroupRepository();

  Future<Group> createGroup(String name, Time wakeTime) async {
    Group newGroup = await repository.createGroup(name, wakeTime);
    return newGroup;
  }

  Future<List<Group>> getGroupByName(String name) async {
    return await repository.getGroup(name);
  }

  Future<void> fetchJoinedGrouop() async {
    _joinedGroups.value = await repository.getJoinedGroup();
  }
}
