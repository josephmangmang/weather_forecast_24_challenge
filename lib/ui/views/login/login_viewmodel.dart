import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_forecast_24_challenge/app/app.router.dart';
import 'package:weather_forecast_24_challenge/services/repository/repository.dart';

import '../../../app/app.locator.dart';

class LoginViewModel extends BaseViewModel {
  final _repository = locator<Repository>();
  final _snackBarService = locator<SnackbarService>();
  final _navigatorService = locator<NavigationService>();

  Future<void> loginPressed() async {
    final response = await _repository.login();
    response.fold(
      (l) => _snackBarService.showSnackbar(message: l.toString()),
      (r) => _navigatorService.replaceWithHomeView(),
    );
  }
}
