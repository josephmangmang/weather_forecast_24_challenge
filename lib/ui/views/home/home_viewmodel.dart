import 'package:weather_forecast_24_challenge/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_forecast_24_challenge/app/app.router.dart';
import 'package:weather_forecast_24_challenge/models/user.dart';
import 'package:weather_forecast_24_challenge/ui/common/keyboard_manager.dart';

import '../../../resources/resources.dart';
import '../../../services/repository/repository.dart';

class HomeViewModel extends BaseViewModel {
  final _repository = locator<Repository>();
  final _navigationService = locator<NavigationService>();
  final _snackBarService = locator<SnackbarService>();
  String query = '';

  User? user;

  void init() {
    _loadUser();
  }

  Future<void> displayWeatherPressed() async {
    KeyboardManager.hide();
    if (query.isEmpty) {
      _snackBarService.showSnackbar(message: S.current.cityIsEmpty);
      return;
    }

    final response = await _repository.getWeatherData(query);
    response.fold(
      (l) => _snackBarService.showSnackbar(message: l.toString()),
      (r) => _navigationService.navigateToWeatherDetailView(weatherData: r),
    );
  }

  Future<void> onSearchTextChanged(String value) async {
    query = value;
  }

  Future<void> logoutPressed() async {
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  Future<void> _loadUser() async {
    user = await _repository.getUser();
    rebuildUi();
  }
}
