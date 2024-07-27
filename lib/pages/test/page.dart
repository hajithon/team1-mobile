import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/pages/home/home_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/landing_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/login_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/login/register_screen.dart';
import 'package:hajithon_teami_flutter_app/pages/onboarding/pages/profile.dart';
import 'package:hajithon_teami_flutter_app/services/auth/service.dart';
import 'package:hajithon_teami_flutter_app/services/group/model.dart';
import 'package:hajithon_teami_flutter_app/services/group/service.dart';
import 'package:hajithon_teami_flutter_app/services/profile/service.dart';
import 'package:hajithon_teami_flutter_app/services/todo/service.dart';

class TestScreen extends StatelessWidget {
  static const String routeName = '/test';
  const TestScreen({super.key});

  Widget linkToRoute(String route) {
    return TextButton(
      onPressed: () {
        Get.toNamed(route);
      },
      child: Text(route),
    );
  }

  Widget linkToRouteWithArgs(String route, String title, Map<String, dynamic> args) {
    return TextButton(
      onPressed: () {
        Get.toNamed(route, arguments: args);
      },
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route"),
        centerTitle: true,
      ),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        linkToRoute(HomeScreen.routeName),
        linkToRoute(LandingScreen.routeName),
        linkToRoute(LoginScreen.routeName),
        linkToRoute(RegisterScreen.routeName),
        linkToRoute(ProfileOnoboardingScreen.routeName),
        TextButton(
            onPressed: () {
              Get.find<AuthService>().register('test2@test.com', 'test1234');
            },
            child: const Text('register')),
        TextButton(
          onPressed: () {
            Get.find<AuthService>().login('test@test.com', 'test1234');
          },
          child: const Text('login'),
        ),
        TextButton(
          onPressed: () {
            Get.put(ProfileService());
            Get.find<ProfileService>().patchProfile(description: 'hohoho');
          },
          child: const Text('patch profile'),
        ),
        TextButton(
          onPressed: () {
            Get.put(ProfileService());
            Get.find<ProfileService>().fetchProfile();
          },
          child: const Text('getprofile'),
        ),
        TextButton(
          onPressed: () {
            Get.put(GroupService());
            Get.find<GroupService>().createGroup('test group', const Time(hour: 7, minute: 0));
          },
          child: const Text('create group'),
        ),
        TextButton(
          onPressed: () {
            Get.put(GroupService());
            Get.find<GroupService>().getGroupByName('test group');
          },
          child: const Text('get group'),
        ),
        TextButton(
          onPressed: () {
            Get.put(GroupService());
            Get.find<GroupService>().fetchJoinedGrouop();
          },
          child: const Text('get joined group'),
        ),
        TextButton(
          onPressed: () {
            Get.put(GroupService());
            Get.find<GroupService>().deleteGroup(6);
          },
          child: const Text('delete group'),
        ),
        TextButton(
          onPressed: () {
            Get.put(TodoService());
            Get.find<TodoService>().createTodo('test todo');
          },
          child: const Text('create todo'),
        ),
        TextButton(
          onPressed: () {
            Get.put(GroupService());
            Get.find<GroupService>().setWakeTime(7, const Time(hour: 11));
          },
          child: const Text('editi group'),
        ),
        TextButton(
          onPressed: () {
            Get.put(ProfileService());
            Get.find<ProfileService>().searchUserByEmail('test@test.com');
          },
          child: const Text('search user by email'),
        ),
        TextButton(
          onPressed: () {
            Get.put(GroupService());
            Get.find<GroupService>().inviteMember(7, 'dbswjd5588@gmail.com');
          },
          child: const Text('invite member to group'),
        ),
        TextButton(
          onPressed: () {
            Get.put(TodoService());
            Get.find<TodoService>().createTodo('haha');
          },
          child: const Text('create todo'),
        ),
        TextButton(
          onPressed: () {
            Get.put(TodoService());
            Get.find<TodoService>().fetchTodos();
          },
          child: const Text('get todos'),
        ),
        TextButton(
          onPressed: () {
            Get.put(TodoService());
            Get.find<TodoService>().editTodo(10, done: true);
          },
          child: const Text('patch todo'),
        ),
        TextButton(
          onPressed: () {
            Get.put(TodoService());
            Get.find<TodoService>().deleteTodo(8);
          },
          child: const Text('delete todo'),
        ),
        TextButton(
          onPressed: () {
            Get.find<AuthService>().logout();
          },
          child: const Text('logout'),
        ),
      ]),
    );
  }
}
