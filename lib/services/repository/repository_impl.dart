import 'package:dartz/dartz.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_forecast_24_challenge/app/constants/env_constants.dart';
import 'package:weather_forecast_24_challenge/models/user.dart';
import 'package:weather_forecast_24_challenge/models/weather_data.dart';
import 'package:weather_forecast_24_challenge/services/api/api_service.dart';

import '../../app/app.locator.dart';
import '../../app/common/session_manager.dart';
import 'exceptions/api_exception.dart';
import 'mapper/mapper.dart';
import 'repository.dart';

class RepositoryImpl extends Repository {
  final ApiService apiService = locator<ApiService>();
  final Auth0 auth0 = Auth0(EnvConstants.oauthDomain, EnvConstants.oauthClientId);
  final serverUserDataMapper = ServerUserDataMapper();
  final serverWeatherDataMapper = ServerWeatherDataMapper();

  @override
  bool get isDarkMode => false;

  @override
  Future<bool> get isLoggedIn => SessionManager.isLogin();

  @override
  Future<Either<ApiRequestException, User>> login() async {
    try {
     final _credentials = await auth0.webAuthentication(scheme: EnvConstants.oauthScheme).login();
      final user = serverUserDataMapper.mapToEntity(_credentials.user);
      SessionManager.login(user);
      return Right(user);
    } catch (e) {
      return Left(ApiRequestException('unexpected error'));
    }
  }

  @override
  Future<void> logout() async {
    await SessionManager.logout();
    return auth0.webAuthentication().logout();
  }

  @override
  Future<User?> getUser() async {
    return SessionManager.getUser();
  }

  @override
  Future<Either<ApiRequestException, WeatherData>> getWeatherData(String address) async {
    if (address.isEmpty) {
      return Left(ApiRequestException('Query is empty'));
    }
    try {
      final location = await getAddressLocation(address);
      if (location == null) {
        return Left(ApiRequestException('No equevalent location found for this address'));
      } else {
        final apiResponse = await apiService.getWeather(location.latitude, location.longitude);

        if (apiResponse != null) {
          return Right(serverWeatherDataMapper.mapToEntity(apiResponse));
        } else {
          return Left(ApiRequestException('No weather found for this address'));
        }
      }
    } catch (e) {
      return Left(ApiRequestException('Error when doing the request, please try again'));
    }
  }

  @override
  Future<Location?> getAddressLocation(String address) async {
    final response = await apiService.getGeocodingFromAddress(address);
    if (response.geodata.isNotEmpty) {
      final geoData = response.geodata.first;
      return Location(latitude: geoData.lat, longitude: geoData.lon, timestamp: DateTime.now());
    }
    return null;
  }
}
