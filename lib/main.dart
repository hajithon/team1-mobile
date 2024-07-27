import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/core/utils/loader.dart';
import 'package:hajithon_teami_flutter_app/routes/routes.dart';

void main() async {
  await AppLoader().load();
  runApp(
    MaterialApp.router(
      title: '하지톤 temai',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    ),
  );
}
