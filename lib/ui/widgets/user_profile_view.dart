import 'package:flutter/material.dart';
import 'package:weather_forecast_24_challenge/models/user.dart';
import 'package:weather_forecast_24_challenge/ui/common/ui_helpers.dart';

import '../../resources/resources.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          user.picture.toString(),
          height: 100,
          width: 100,
        ),
        verticalSpace(16),
        Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        verticalSpace(16),
        Text(
          user.profileUrl?.toString() ??
              S.of(context).githubPageUrlNotAvailable,
        ),
        verticalSpace(16),
      ],
    );
  }
}
