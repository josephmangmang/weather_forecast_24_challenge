import 'package:weather_forecast_24_challenge/models/weather_data.dart';
import 'package:weather_forecast_24_challenge/services/api/response/weather_response.dart';
import 'package:weather_forecast_24_challenge/services/repository/mapper/base_data_mapper.dart';

class ServerWeatherDataMapper extends BaseDataMapper<WeatherResponse, WeatherData> {
  @override
  WeatherData mapToEntity(WeatherResponse? data) {
    return WeatherData(
      name: data?.name ?? '',
      temp: data?.main?.temp,
      description: _getDescription(data?.weather),
      main: _getMain(data?.weather),
      pressure: data?.main?.pressure ?? 0,
      humidity: data?.main?.humidity ?? 0,
      dateTime: DateTime.now(),
    );
  }

  String _getDescription(List<Weather>? weather) {
    if (weather?.isNotEmpty == true) {
      return weather!.first.description ?? '';
    } else {
      return '';
    }
  }

  String _getMain(List<Weather>? weather) {
    if (weather?.isNotEmpty == true) {
      return weather!.first.main ?? '';
    } else {
      return '';
    }
  }
}
