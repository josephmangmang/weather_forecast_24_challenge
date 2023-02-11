import 'package:stacked/stacked.dart';
import 'package:weather_forecast_24_challenge/app/app.locator.dart';
import 'package:weather_forecast_24_challenge/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_forecast_24_challenge/services/repository/repository.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _repository = locator<Repository>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    if (_repository.isLoggedIn) {
      _navigationService.replaceWithHomeView();
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}
