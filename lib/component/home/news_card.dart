import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';
import 'package:hajithon_teami_flutter_app/pages/quiz/news_screen.dart';

class NewsCard extends StatelessWidget {
  final String title;

  final List<String> headlines;

  const NewsCard({
    super.key,
    required this.title,
    required this.headlines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyles.titleTextStyle.copyWith(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: headlines
                .map(
                  (headline) => Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      headline,
                      style: TextStyles.descriptionTextStyle.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20.0),
          CustomElevatedButton(
            text: '오늘의 뉴스/퀴즈 풀러가기',
            onPressed: () => Get.toNamed(
              NewsScreen.routeName,
            ),
            fontSize: 16.0,
          ),
        ],
      ),
    );
  }
}
