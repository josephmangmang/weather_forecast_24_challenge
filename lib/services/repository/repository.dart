abstract class Repository {
  bool get isLoggedIn;

  bool get isFirstLaunchApp;

  bool get isFirstLogin;

  bool get isDarkMode;

  Future<void> login();

  Future<void> logout();
}
