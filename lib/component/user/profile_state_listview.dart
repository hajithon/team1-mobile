import 'package:flutter/material.dart';
import 'package:hajithon_teami_flutter_app/services/profile/model.dart';
import 'package:hajithon_teami_flutter_app/view_model/strict/strict_model.dart';

class ProfileStateListview extends StatelessWidget {
  final List<Profile> users;

  const ProfileStateListview({
    super.key,
    required this.users,
  });

  WakeUpState statusToWakeUpState(int status) {
    if (status == 0) {
      return WakeUpState.sleeping;
    } else if (status == 1) {
      return WakeUpState.wakeUp;
    } else if (status == 2) {
      return WakeUpState.wakeUpLate;
    } else {
      return WakeUpState.quizCompleted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: users
          .where((user) => user.getTodayWake() != null)
          .map(
            (user) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ProfileState(
                imageUrl: user.profileImage ?? '',
                state: statusToWakeUpState(user.getTodayWake()!.status),
              ),
            ),
          )
          .toList(),
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
