import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: Center(child: Text('Home')));
  }
}
