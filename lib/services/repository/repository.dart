import 'package:dartz/dartz.dart';

import '../../models/user.dart';
import 'exceptions/api_exception.dart';

abstract class Repository {
  bool get isLoggedIn;

  bool get isDarkMode;

  Future<Either<ApiRequestException, User>> login();

  Future<void> logout();

  Future<User?> getUser();
}
