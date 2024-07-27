import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/core/utils/loader.dart';
import 'package:hajithon_teami_flutter_app/pages/test/page.dart';
import 'package:hajithon_teami_flutter_app/routes/routes.dart';

void main() async {
  await AppLoader().load();
  runApp(
    GetMaterialApp(
      title: '하지톤 temai',
      debugShowCheckedModeBanner: false,
      initialRoute: TestScreen.routeName,
      getPages: AppPages.pages,
      theme: ThemeData(
        fontFamily: 'SUIT',
      ),
    ),
  );
}
