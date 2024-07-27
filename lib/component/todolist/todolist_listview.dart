import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/component/common/custom_text_style.dart';
import 'package:hajithon_teami_flutter_app/const/color/color.dart';
import 'package:hajithon_teami_flutter_app/services/todo/model.dart';
import 'package:hajithon_teami_flutter_app/services/todo/service.dart';

class TodolistListview extends StatelessWidget {
  final List<Todo> todos;

  const TodolistListview({
    super.key,
    required this.todos,
  });

  @override
  Widget build(BuildContext context) => Column(
      children: todos
          .map(
            (e) => _TodoTile(
              todo: e,
              onTap: () => Get.find<TodoService>().editTodo(e.id!, done: !e.done),
            ),
          )
          .toList());
}

class _TodoTile extends StatelessWidget {
  final Todo todo;
  final void Function()? onTap;

  const _TodoTile({
    required this.todo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            Checkbox(
              value: todo.done,
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
              todo.title,
              style: TextStyles.subTitleTextStyle.copyWith(
                fontSize: 16.0,
                color: titleTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
