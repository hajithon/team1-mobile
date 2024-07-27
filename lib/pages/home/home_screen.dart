import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_elevated_button.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/view_model/strict/strict_model.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SingleChildScrollView(
        child: Column(children: [
          const _NewsCard(
            title: '좋은 아침이에요!',
            headlines: [
              '오픈AI, 검색 엔진 공개.. 구글에 도전장',
              '테슬라, 1조 달러 시가총액 돌파',
            ],
          ),
          const SizedBox(height: 14.0),
          _WeeklyStrictCard(
            title: '이번 주 n일 연속 성공헀어요!',
            stricts: _weeklyData,
          ),
        ]),
      ),
    );
  }
}

List<StrictModel> _weeklyData = [
  StrictModel(
    date: DateTime(2024, 7, 28),
    wakeUpState: WakeUpState.wakeUp,
  ),
  StrictModel(
    date: DateTime(2024, 7, 29),
    wakeUpState: WakeUpState.wakeUpLate,
  ),
  StrictModel(
    date: DateTime(2024, 7, 30),
    wakeUpState: WakeUpState.quizCompleted,
  ),
  StrictModel(
    date: DateTime(2024, 7, 31),
    wakeUpState: null,
  ),
  StrictModel(
    date: DateTime(2024, 8, 1),
    wakeUpState: null,
  ),
  StrictModel(
    date: DateTime(2024, 8, 2),
    wakeUpState: null,
  ),
  StrictModel(
    date: DateTime(2024, 8, 3),
    wakeUpState: null,
  ),
];

class _NewsCard extends StatelessWidget {
  final String title;

  final List<String> headlines;

  const _NewsCard({
    required this.title,
    required this.headlines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: inputBackgroundColor),
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
            onPressed: () {},
            fontSize: 16.0,
          ),
        ],
      ),
    );
  }
}

class _WeeklyStrictCard extends StatelessWidget {
  final String title;
  final List<StrictModel> stricts;

  const _WeeklyStrictCard({
    required this.title,
    required this.stricts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: inputBackgroundColor),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.titleTextStyle.copyWith(
                  fontSize: 16.0,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '전체 보기',
                  style: TextStyles.subTitleTextStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < stricts.length; i++) ...[
                if (i > 0) const SizedBox(width: 8.0),
                Expanded(
                  child: _StrictDayBox(
                    date: stricts[i].date,
                    wakeUpState: stricts[i].wakeUpState,
                  ),
                ),
              ],
            ],
          )
        ],
      ),
    );
  }
}

class _StrictDayBox extends StatelessWidget {
  final DateTime date;
  final WakeUpState? wakeUpState;

  const _StrictDayBox({required this.date, this.wakeUpState});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: _getBackgroundColor(),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            DateFormat('E', 'ko_KR').format(date),
            style: TextStyles.subTitleTextStyle,
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (wakeUpState) {
      case WakeUpState.wakeUp:
        return Colors.green;
      case WakeUpState.wakeUpLate:
        return Colors.red;
      case WakeUpState.quizCompleted:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
