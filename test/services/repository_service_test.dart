import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast_24_challenge/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('RepositoryServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
