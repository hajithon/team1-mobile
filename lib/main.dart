import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/core/utils/loader.dart';
import 'package:hajithon_teami_flutter_app/pages/home/home_screen.dart';
import 'package:hajithon_teami_flutter_app/routes/routes.dart';

void main() async {
  await AppLoader().load();
  runApp(
    GetMaterialApp(
      title: '하지톤 temai',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      getPages: AppPages.pages,
    ),
  );
}
