import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/component/news/news_tile.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/pages/home/home_screen.dart';
import 'package:hajithon_teami_flutter_app/services/news/model.dart';

class QuizScreen extends StatefulWidget {
  static const String routeName = '/quiz';

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) => setState(() {
                  _currentIndex = index;
                  print(_currentIndex);
                }),
              ),
              items: [
                _QuizQuestionWidget(
                  question: '오픈AI가 런칭한 검색 엔진의 이름은‘GPT엔진’이다.',
                  answer: true,
                  news: News(
                    id: 1,
                    title: 'title',
                    url: 'https://github.com/hajithon/team1-mobile',
                    summary: 'summary',
                    publishedAt: DateTime.now(),
                    keyword: 'keyword',
                  ),
                ),
                _QuizQuestionWidget(
                  question: '오픈AI가 런칭한 검색 엔진의 이름은‘GPT엔진’이다.',
                  answer: true,
                  news: News(
                    id: 1,
                    title: 'title',
                    url: 'https://github.com/hajithon/team1-mobile',
                    summary: 'summary',
                    publishedAt: DateTime.now(),
                    keyword: 'keyword',
                  ),
                ),
                _QuizQuestionWidget(
                  question: '오픈AI가 런칭한 검색 엔진의 이름은‘GPT엔진’이다.',
                  answer: true,
                  news: News(
                    id: 1,
                    title: 'title',
                    url: 'https://github.com/hajithon/team1-mobile',
                    summary: 'summary',
                    publishedAt: DateTime.now(),
                    keyword: 'keyword',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          _currentIndex < 2
              /**추후 퀴즈 갯수로 대체 */ ? CustomElevatedButton(
                  text: '다음',
                  onPressed: () {
                    _carouselController.nextPage();
                  })
              : CustomElevatedButton(
                  text: '완료',
                  onPressed: () => Get.offAllNamed(
                    HomeScreen.routeName,
                  ),
                )
        ],
      ),
    );
  }
}

class _QuizQuestionWidget extends StatefulWidget {
  final String question;
  final bool answer;
  final News news;

  const _QuizQuestionWidget({
    required this.question,
    required this.answer,
    required this.news,
  });

  @override
  State<_QuizQuestionWidget> createState() => _QuizQuestionWidgetState();
}

class _QuizQuestionWidgetState extends State<_QuizQuestionWidget> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.question,
                  style: TextStyles.titleTextStyle.copyWith(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 44.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedIndex == 0) {
                        _selectedIndex = -1;
                      } else {
                        _selectedIndex = 0;
                      }
                    });
                  },
                  child: _OptionCard(
                    answer: true,
                    isSelected: _selectedIndex == 0,
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedIndex == 1) {
                        _selectedIndex = -1;
                      } else {
                        _selectedIndex = 1;
                      }
                    });
                  },
                  child: _OptionCard(
                    answer: false,
                    isSelected: _selectedIndex == 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        // 관련 뉴스
        const Text('관련 뉴스', style: TextStyles.hintTextStyle),
        NewsTile(
          title: widget.news.title,
          url: widget.news.url,
        ),
      ],
    );
  }
}

class _OptionCard extends StatelessWidget {
  final bool answer;
  final bool isSelected;

  const _OptionCard({
    required this.answer,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? orangeLight : grey100,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: isSelected ? primaryColor : grey100,
          )),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(
            answer ? Icons.circle_outlined : Icons.close_outlined,
            color: primaryColor,
          ),
          const SizedBox(
            width: 19.0,
          ),
          Text(
            answer ? '맞다' : '아니다',
            style: TextStyles.titleTextStyle.copyWith(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuizAnswer extends StatelessWidget {
  final bool isCorrect;
  final String question;
  final bool answer;
  final String comment;

  const _QuizAnswer({
    required this.isCorrect,
    required this.question,
    required this.answer,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                isCorrect ? '맞았어요' : '틀렸어요',
                style: TextStyles.titleTextStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                question,
                style: TextStyles.titleTextStyle.copyWith(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Icon(
                answer ? Icons.circle_outlined : Icons.close_outlined,
                color: primaryColor,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: grey100,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            comment,
            style: TextStyles.descriptionTextStyle.copyWith(
              fontSize: 20.0,
            ),
          ),
        ),
        CustomElevatedButton(text: '다음', onPressed: () {}),
      ],
    );
  }
}
