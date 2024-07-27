import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/component/home/news_card.dart';
import 'package:hajithon_teami_flutter_app/component/home/weekly_strict_card.dart';
import 'package:hajithon_teami_flutter_app/component/todolist/todolist_listview.dart';
import 'package:hajithon_teami_flutter_app/component/user/profile_state_listview.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';
import 'package:hajithon_teami_flutter_app/pages/common/default_layout.dart';
import 'package:hajithon_teami_flutter_app/view_model/strict/strict_model.dart';
import 'package:hajithon_teami_flutter_app/view_model/todo/todo_model.dart';
import 'package:hajithon_teami_flutter_app/view_model/user/user_model.dart';
import 'package:intl/date_symbol_data_local.dart';

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
      floatingActionButton: const _GroupFloatingActionButton(),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 프로필 상태 리스트뷰
            SizedBox(
              height: 90,
              child: ProfileStateListview(users: _userList),
            ),

            // 뉴스 및 퀴즈 풀러가기 카드
            const NewsCard(
              title: '좋은 아침이에요!',
              headlines: [
                '오픈AI, 검색 엔진 공개.. 구글에 도전장',
                '테슬라, 1조 달러 시가총액 돌파',
              ],
            ),
            const SizedBox(height: 14.0),

            // 주간 스트릭 카드
            WeeklyStrictCard(
              title: '이번 주 n일 연속 성공헀어요!',
              stricts: _weeklyData,
            ),
            const SizedBox(height: 28.0),

            // 투두리스트
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '오늘의 할 일',
                    style: TextStyles.titleTextStyle.copyWith(
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  TodolistListview(todos: _todoData),
                  const _AddTodoFormField(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GroupFloatingActionButton extends StatelessWidget {
  const _GroupFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      activeIcon: Icons.close,
      icon: Icons.group_add_outlined,
      childMargin: const EdgeInsets.all(16.0),
      children: [
        // 1. 초대하기
        SpeedDialChild(
          child: Transform.rotate(
            angle: -0.7853,
            child: const Icon(Icons.send_outlined),
          ),
          shape: const CircleBorder(),
          backgroundColor: inputBackgroundColor,
          label: '초대하기',
          labelStyle: TextStyles.subTitleTextStyle.copyWith(
            fontSize: 16.0,
            color: titleTextColor,
          ),
          onTap: () {},
        ),
        // 2. 그룹 생성
        SpeedDialChild(
          child: const Icon(Icons.group_add_outlined),
          shape: const CircleBorder(),
          backgroundColor: inputBackgroundColor,
          label: '그룹생성',
          labelStyle: TextStyles.subTitleTextStyle.copyWith(
            fontSize: 16.0,
            color: titleTextColor,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}

class _AddTodoFormField extends StatefulWidget {
  const _AddTodoFormField();

  @override
  State<_AddTodoFormField> createState() => _AddTodoFormFieldState();
}

class _AddTodoFormFieldState extends State<_AddTodoFormField> {
  String newTodo = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20.0,
          child: GestureDetector(
            onTap: () {
              /// TODO: todolist 추가 로직 작성
            },
            child: const Icon(
              Icons.add,
              color: titleTextColor,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: TextField(
            onChanged: (value) {
              setState(() {
                newTodo = value;
              });
            },
            decoration: InputDecoration(
              hintText: '오늘의 할 일 추가하기',
              border: InputBorder.none,
              hintStyle: TextStyles.subTitleTextStyle.copyWith(
                fontSize: 16.0,
                color: titleTextColor.withOpacity(0.5),
              ),
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}

List<TodoModel> _todoData = [
  TodoModel(
    title: '아침에 일어나기',
    isDone: false,
  ),
  TodoModel(
    title: '아침에 일어나기',
    isDone: false,
  ),
  TodoModel(
    title: '아침에 일어나기',
    isDone: false,
  ),
  TodoModel(
    title: '아침에 일어나기',
    isDone: false,
  ),
  TodoModel(
    title: '아침에 일어나기',
    isDone: false,
  ),
  TodoModel(
    title: '아침에 일어나기',
    isDone: false,
  ),
  TodoModel(
    title: '아침에 일어나기',
    isDone: false,
  ),
];

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

List<UserModel> _userList = [
  const UserModel(
    uid: '1',
    profileImageUrl:
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
    name: '김철수',
    state: WakeUpState.wakeUp,
  ),
  const UserModel(
    uid: '2',
    profileImageUrl:
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
    name: '김영희',
    state: WakeUpState.wakeUpLate,
  ),
  const UserModel(
    uid: '3',
    profileImageUrl:
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
    name: '김철수',
    state: WakeUpState.quizCompleted,
  ),
  const UserModel(
    uid: '4',
    profileImageUrl:
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
    name: '김영희',
    state: WakeUpState.sleeping,
  ),
  const UserModel(
    uid: '5',
    profileImageUrl:
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
    name: '김철수',
    state: WakeUpState.sleeping,
  ),
  const UserModel(
    uid: '6',
    profileImageUrl:
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
    name: '김영희',
    state: WakeUpState.sleeping,
  ),
];
