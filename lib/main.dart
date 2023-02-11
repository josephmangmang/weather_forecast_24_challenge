import 'package:flutter/material.dart';
import 'package:weather_forecast_24_challenge/app/app.bottomsheets.dart';
import 'package:weather_forecast_24_challenge/app/app.dialogs.dart';
import 'package:weather_forecast_24_challenge/app/app.locator.dart';

import 'ui/views/app/my_app.dart';

void main() {
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}
