import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String nickname,
    required String name,
    Uri? picture,
  }) = _User;
}
