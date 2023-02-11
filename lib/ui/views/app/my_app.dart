import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_forecast_24_challenge/app/app.router.dart';
import 'package:weather_forecast_24_challenge/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../app/constants/locale_constant.dart';
import '../../../resources/resources.dart';
import 'app_viewmodel.dart';

class MyApp extends StackedView<AppViewModel> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AppViewModel viewModel,
    Widget? child,
  ) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: Theme.of(context).copyWith(
        primaryColor: kcBackgroundColor,
        focusColor: kcPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
      ),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) =>
              supportedLocales.contains(locale)
                  ? locale
                  : const Locale(LocaleConstants.defaultLocale),
      locale: Locale(viewModel.languageCode.localeCode),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }

  @override
  AppViewModel viewModelBuilder(BuildContext context) => AppViewModel();
}
