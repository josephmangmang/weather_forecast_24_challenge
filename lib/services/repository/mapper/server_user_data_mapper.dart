import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:weather_forecast_24_challenge/services/repository/mapper/base_data_mapper.dart';

import '../../../models/user.dart';

class ServerUserDataMapper extends BaseDataMapper<UserProfile, User> {
  @override
  User mapToEntity(UserProfile? data) {
    return User(
      nickname: data?.nickname ?? '',
      name: data?.name ?? '',
      picture: data?.pictureUrl,
    );
  }
}
