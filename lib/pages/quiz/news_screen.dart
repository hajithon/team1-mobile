import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/component/news/news_tile.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/pages/quiz/quiz_screen.dart';
import 'package:hajithon_teami_flutter_app/services/news/model.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = '/news';

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '오늘의 주요 뉴스',
            style: TextStyles.titleTextStyle.copyWith(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20.0),

          // 뉴스 리스트
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final news = _newsList[index];
                return NewsTile(
                  title: news.title,
                  url: news.url,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemCount: _newsList.length,
            ),
          ),
          CustomElevatedButton(
            text: '퀴즈 풀러가기',
            onPressed: () => Get.toNamed(
              QuizScreen.routeName,
            ),
          )
        ],
      ),
    );
  }
}

final List<News> _newsList = [
  News(
    id: 0,
    title: '오픈AI',
    url: 'https://deku.posstree.com/en/flutter/url_launcher/',
    summary: '요약',
    publishedAt: DateTime(2024, 7, 24),
  ),
  News(
    id: 0,
    title: '오픈AI',
    url: 'https://deku.posstree.com/en/flutter/url_launcher/',
    summary: '요약',
    publishedAt: DateTime(2024, 7, 24),
  ),
  News(
    id: 0,
    title: '오픈AI',
    url: 'https://deku.posstree.com/en/flutter/url_launcher/',
    summary: '요약',
    publishedAt: DateTime(2024, 7, 24),
  ),
  News(
    id: 0,
    title: '오픈AI',
    url: 'https://deku.posstree.com/en/flutter/url_launcher/',
    summary: '요약',
    publishedAt: DateTime(2024, 7, 24),
  ),
  News(
    id: 0,
    title: '오픈AI',
    url: 'https://deku.posstree.com/en/flutter/url_launcher/',
    summary: '요약',
    publishedAt: DateTime(2024, 7, 24),
  ),
  News(
    id: 0,
    title: '오픈AI',
    url: 'https://deku.posstree.com/en/flutter/url_launcher/',
    summary: '요약',
    publishedAt: DateTime(2024, 7, 24),
  ),
];
