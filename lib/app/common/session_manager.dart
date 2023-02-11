import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

class SessionManager {
  SessionManager._();

  static Future<void> login(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', jsonEncode(user.toJson()));
    } catch (e) {
      print(e);
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<bool> isLogin() async {
    return await getUser() != null;
  }

  static Future<User?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return User.fromJson(jsonDecode(prefs.getString('user')!));
    } catch (e) {
      return null;
    }
  }
}
