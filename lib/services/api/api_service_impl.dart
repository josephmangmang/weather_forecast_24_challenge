import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_forecast_24_challenge/services/api/api_service.dart';
import 'package:weather_forecast_24_challenge/services/api/response/geocoding_response.dart';
import 'package:weather_forecast_24_challenge/services/api/response/weather_response.dart';

import '../../app/constants/env_constants.dart';

class ApiServiceImpl extends ApiService {
  final apiKey = EnvConstants.weatherMapAPIKey;
  final dio = _buildDio();

  static Dio _buildDio() {
    return Dio(BaseOptions(baseUrl: EnvConstants.baseUrl))
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
  }

  @override
  Future<GeocodingResponse> getGeocodingFromAddress(String address) async {
    final response = await dio.get('/geo/1.0/direct', queryParameters: {
      'appid': apiKey,
      'q': address,
    });
    if (response.statusCode == HttpStatus.ok) {
      return GeocodingResponse.fromJson({'geodata': response.data});
    }
    return GeocodingResponse(geodata: []);
  }

  @override
  Future<WeatherResponse?> getWeather(double latitude, double longitude) async {
    final response = await dio.get('/data/2.5/weather', queryParameters: {
      'appid': apiKey,
      'lat': latitude,
      'lon': longitude,
    });
    if (response.statusCode == HttpStatus.ok) {
      return WeatherResponse.fromJson(response.data);
    }
    return null;
  }
}
