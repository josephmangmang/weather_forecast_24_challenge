import 'response/geocoding_response.dart';
import 'response/weather_response.dart';

abstract class ApiService {
  Future<GeocodingResponse> getGeocodingFromAddress(String address);

  Future<WeatherResponse?> getWeather(double latitude, double longitude);
}
