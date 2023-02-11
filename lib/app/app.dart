import 'package:weather_forecast_24_challenge/services/api/api_service_impl.dart';
import 'package:weather_forecast_24_challenge/services/repository/repository.dart';
import 'package:weather_forecast_24_challenge/services/repository/repository_impl.dart';
import 'package:weather_forecast_24_challenge/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:weather_forecast_24_challenge/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:weather_forecast_24_challenge/ui/views/home/home_view.dart';
import 'package:weather_forecast_24_challenge/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_forecast_24_challenge/ui/views/login/login_view.dart';

import 'package:weather_forecast_24_challenge/ui/views/weather_detail/weather_detail_view.dart';
import 'package:weather_forecast_24_challenge/services/api/api_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: WeatherDetailView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: RepositoryImpl, asType: Repository),
    LazySingleton(classType: ApiServiceImpl, asType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
