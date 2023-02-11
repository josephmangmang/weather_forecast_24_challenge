import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/geo_data.dart';

part 'geocoding_response.freezed.dart';

part 'geocoding_response.g.dart';

@freezed
class GeocodingResponse with _$GeocodingResponse {
  factory GeocodingResponse({@Default([]) List<GeoData> geodata}) = _GeocodingResponse;

  factory GeocodingResponse.fromJson(Map<String, dynamic> json) => _$GeocodingResponseFromJson(json);
}
