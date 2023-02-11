import 'package:flutter/material.dart';
import 'package:weather_forecast_24_challenge/extensions/date_time_extension.dart';

import '../../../models/weather_data.dart';
import '../../../resources/resources.dart';

class WeatherTable extends StatelessWidget {
  const WeatherTable({super.key, required this.weatherData});

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        headerRow(),
        valueRow(),
      ],
    );
  }

  TableRow headerRow() {
    return TableRow(children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Container(
          height: 32,
          width: 32,
          color: Colors.grey,
          alignment: AlignmentDirectional.center,
          child: Text(
            S.current.headerDate,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: 32,
          color: Colors.grey,
          alignment: AlignmentDirectional.center,
          child: Text(
            S.current.headerTemperature,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]);
  }

  TableRow valueRow() {
    return TableRow(
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      children: <Widget>[
        Container(
          height: 64,
          color: Colors.grey.shade100,
          alignment: AlignmentDirectional.center,
          child: Text(weatherData.dateTime.toReadableDate()),
        ),
        Container(
          color: Colors.grey.shade100,
          height: 64,
          alignment: AlignmentDirectional.center,
          child: Text('${weatherData.temp ?? ''}'),
        ),
      ],
    );
  }
}
