import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_data.freezed.dart';

part 'geo_data.g.dart';

@freezed
class GeoData with _$GeoData {
  const factory GeoData({
    required String name,
    required double lat,
    required double lon,
    required String country,
    required String state,
  }) = _GeoData;

  factory GeoData.fromJson(Map<String, dynamic> json) => _$GeoDataFromJson(json);
}
