import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/group/model.dart';
import 'package:hajithon_teami_flutter_app/services/group/repository.dart';

class GroupService extends GetxController {
  final Rx<List<Group>> _joinedGroups = Rx([]);
  List<Group> get joinedGroups => _joinedGroups.value;
  final GroupRepository repository;

  GroupService({GroupRepository? repository}) : repository = repository ?? GroupRepository();

  Future<Group> createGroup(String name, Time wakeTime) async {
    Group newGroup = await repository.createGroup(name, wakeTime);

    List<Group> newJoinedGroups = List.from(joinedGroups);
    newJoinedGroups.add(newGroup);
    _joinedGroups.value = newJoinedGroups;

    return newGroup;
  }

  Future<List<Group>> getGroupByName(String name) async {
    return await repository.getGroup(name);
  }

  Future<Group> setWakeTime(int groupId, Time wakeTime) async {
    Group updatedGroup = await repository.patchGroup(groupId, wakeTime: wakeTime);

    List<Group> newJoinedGroups = List.from(joinedGroups);
    newJoinedGroups.removeWhere((group) => group.id == groupId);
    newJoinedGroups.add(updatedGroup);
    _joinedGroups.value = newJoinedGroups;

    return updatedGroup;
  }

  Future<Group> setGroupName(int groupId, String name) async {
    Group updatedGroup = await repository.patchGroup(groupId, name: name);

    List<Group> newJoinedGroups = List.from(joinedGroups);
    newJoinedGroups.removeWhere((group) => group.id == groupId);
    newJoinedGroups.add(updatedGroup);
    _joinedGroups.value = newJoinedGroups;

    return updatedGroup;
  }

  Future<void> fetchJoinedGrouop() async {
    _joinedGroups.value = await repository.getJoinedGroup();
  }

  Future<void> inviteMember(int groupId, String email) async {
    Group updatedGroup = await repository.inviteMemeber(groupId, email);

    List<Group> newJoinedGroups = List.from(joinedGroups);
    newJoinedGroups.removeWhere((group) => group.id == groupId);
    newJoinedGroups.add(updatedGroup);
    _joinedGroups.value = newJoinedGroups;
  }

  Future<void> deleteGroup(int id) async {
    await repository.deleteGroup(id);

    List<Group> newJoinedGroups = List.from(joinedGroups);
    newJoinedGroups.removeWhere((group) => group.id == id);
    _joinedGroups.value = newJoinedGroups;
  }
}
