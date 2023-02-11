import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_forecast_24_challenge/app/app.router.dart';
import 'package:weather_forecast_24_challenge/models/weather_data.dart';

import '../../../app/app.locator.dart';

class WeatherDetailViewModel extends BaseViewModel {
  WeatherDetailViewModel(this.weatherData);

  final _navigationService = locator<NavigationService>();
  final WeatherData weatherData;

  Future<void> onBackPressed() async {
    _navigationService.back();
  }

  Future<void> logoutPressed() async {
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
