import 'package:dartz/dartz.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:weather_forecast_24_challenge/app/constants/env_constants.dart';
import 'package:weather_forecast_24_challenge/models/user.dart';
import 'package:weather_forecast_24_challenge/services/repository/mapper/server_user_data_mapper.dart';

import 'exceptions/api_exception.dart';
import 'repository.dart';

class RepositoryImpl extends Repository {
  Credentials? _credentials;
  Auth0 auth0 = Auth0(EnvConstants.oauthDomain, EnvConstants.oauthClientId);
  final serverUserDataMapper = ServerUserDataMapper();

  @override
  bool get isDarkMode => false;

  @override
  bool get isLoggedIn => _credentials != null;

  @override
  Future<Either<ApiRequestException, User>> login() async {
    try {
      _credentials = await auth0
          .webAuthentication(scheme: EnvConstants.oauthScheme)
          .login();
      return Right(serverUserDataMapper.mapToEntity(_credentials?.user));
    } catch (e) {
      return Left(ApiRequestException('unexpected error'));
    }
  }

  @override
  Future<void> logout() {
    _credentials = null;
    return auth0.webAuthentication().logout();
  }

  @override
  Future<User?> getUser() async {
    return serverUserDataMapper.mapToEntity(_credentials?.user);
  }
}
