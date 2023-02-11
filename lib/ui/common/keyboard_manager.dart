import 'package:flutter/widgets.dart';

class KeyboardManager {
  KeyboardManager._();

  static void hide() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
