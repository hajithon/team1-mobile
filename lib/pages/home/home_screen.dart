import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/home/news_card.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        child: Center(
            child: NewsCard(
      title: '좋은 아침이에요!',
      headlines: [
        '오픈AI, 검색 엔진 공개.. 구글에 도전장',
        '테슬라, 1조 달러 시가총액 돌파',
      ],
    )));
  }
}
