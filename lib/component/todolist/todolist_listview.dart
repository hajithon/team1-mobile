import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';
import 'package:hajithon_teami_flutter_app/view_model/todo/todo_model.dart';

class TodolistListview extends StatelessWidget {
  final List<TodoModel> todos;

  const TodolistListview({
    super.key,
    required this.todos,
  });

  @override
  Widget build(BuildContext context) => Column(children: [
        for (int i = 0; i < todos.length; i++) ...[
          if (i > 0) const SizedBox(height: 18.0),
          _TodoTile.fromModel(todos[i]),
        ],
      ]);
}

class _TodoTile extends StatelessWidget {
  final String title;
  final bool isDone;

  const _TodoTile({
    required this.title,
    required this.isDone,
  });

  factory _TodoTile.fromModel(TodoModel model) {
    return _TodoTile(
      title: model.title,
      isDone: model.isDone,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isDone,
          onChanged: (value) {},

          // 기본 패딩 없애기
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
        ),
        const SizedBox(width: 16.0),
        Text(
          title,
          style: TextStyles.subTitleTextStyle.copyWith(
            fontSize: 16.0,
            color: titleTextColor,
          ),
        ),
      ],
    );
  }
}
