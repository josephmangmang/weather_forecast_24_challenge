import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_forecast_24_challenge/models/weather_data.dart';

import '../../../resources/resources.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/widgets.dart';
import 'weather_detail_viewmodel.dart';
import 'weather_table.dart';

class WeatherDetailView extends StackedView<WeatherDetailViewModel> {
  const WeatherDetailView(this.weatherData, {Key? key}) : super(key: key);
  final WeatherData weatherData;

  @override
  Widget builder(
    BuildContext context,
    WeatherDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            AppToolbar(
              trailing: AppButton(
                label: S.current.logout,
                onPressed: viewModel.logoutPressed,
              ),
            ),
            verticalSpace(32),
            Text(
              weatherData.name.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            verticalSpace(16),
            WeatherTable(weatherData: weatherData),
            verticalSpace(50),
            Row(
              children: [
                const Spacer(),
                AppButton(
                  label: S.of(context).back,
                  onPressed: viewModel.onBackPressed,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  WeatherDetailViewModel viewModelBuilder(BuildContext context) => WeatherDetailViewModel(weatherData);
}
