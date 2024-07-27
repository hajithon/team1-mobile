import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/view_model/strict/strict_model.dart';
import 'package:hajithon_teami_flutter_app/view_model/user/user_model.dart';

class ProfileStateListview extends StatelessWidget {
  final List<UserModel> users;

  const ProfileStateListview({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final user = users[index];

        return ProfileState(
          imageUrl: user.profileImageUrl,
          state: user.state,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 12.0),
      itemCount: users.length,
    );
  }
}

class ProfileState extends StatelessWidget {
  final String imageUrl;
  final WakeUpState state;

  const ProfileState({
    super.key,
    required this.imageUrl,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              // TODO: 상태에 따라 색상 변경하는 함수 필요
              color: state == WakeUpState.wakeUp ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
