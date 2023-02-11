import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data.freezed.dart';

@freezed
class WeatherData with _$WeatherData {
  factory WeatherData({
    required String name,
    double? temp,
    required String description,
    required String main,
    required int pressure,
    required int humidity,
    required DateTime dateTime,
  }) = _WeatherData;
}
