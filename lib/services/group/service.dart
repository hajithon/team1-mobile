import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/group/model.dart';
import 'package:hajithon_teami_flutter_app/services/group/repository.dart';

class GroupService extends GetxController {
  final GroupRepository repository;
  GroupService({GroupRepository? repository}) : repository = repository ?? GroupRepository();

  Future<Group> createGroup(String name, Time wakeTime) async {
    Group newGroup = await repository.createGroup(name, wakeTime);
    return newGroup;
  }
}
