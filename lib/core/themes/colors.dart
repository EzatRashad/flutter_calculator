import 'package:flutter/material.dart';
import '../utiles/utiles.dart';

class AppColors {
  static const Color orange = Color(0xffFD8D14);
  static const Color yellow = Color(0xffF7DB6A);
  static const Color red = Color(0xffDF2E38);
  static const Color green = Color(0xff06C88A);

  static Color get grey => Utils.appMode == ThemeMode.light
      ? const Color(0xffD8D9DA)
      : const Color(0xff9D9D9D);
  static Color get black =>
      Utils.appMode == ThemeMode.light ? Colors.black : Colors.white;
  static Color get back => Utils.appMode == ThemeMode.light
      ? Colors.white
      : Color.fromARGB(95, 55, 54, 54);

  static Color get white =>
      Utils.appMode == ThemeMode.light ? Colors.white : Colors.black;
}
