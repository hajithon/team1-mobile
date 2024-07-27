import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';
import 'package:hajithon_teami_flutter_app/view_model/strict/strict_model.dart';
import 'package:intl/intl.dart';

class WeeklyStrictCard extends StatelessWidget {
  final String title;
  final List<StrictModel> stricts;

  const WeeklyStrictCard({
    super.key,
    required this.title,
    required this.stricts,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('asset/bud.png'),
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: TextStyles.titleTextStyle.copyWith(
                      fontSize: 16.0,
                    ),
                  ),
                ],
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
    final backgroundColor = wakeUpState == null ? grey100 : wakeUpState!.color;
    final textColor =
        backgroundColor == grey100 || backgroundColor == orangeBright
            ? Colors.black
            : Colors.white;

    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            DateFormat('E', 'ko_KR').format(date),
            style: TextStyles.subTitleTextStyle.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
