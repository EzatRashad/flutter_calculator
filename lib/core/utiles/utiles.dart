import 'package:flutter/material.dart';

class Utils {
  static  ThemeMode appMode = ThemeMode.light;

}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}
