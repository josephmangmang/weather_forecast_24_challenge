import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';

import '../../models/user.dart';
import '../../models/weather_data.dart';
import 'exceptions/api_exception.dart';

abstract class Repository {
  Future<bool> get isLoggedIn;

  bool get isDarkMode;

  Future<Either<ApiRequestException, User>> login();

  Future<void> logout();

  Future<User?> getUser();

  Future<Either<ApiRequestException, WeatherData>> getWeatherData(
      String address);

  Future<Location?> getAddressLocation(String address);
}
