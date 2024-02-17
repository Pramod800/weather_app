import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color scaffoldColor = Colors.black;
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color firstGradientColor = hexToColor('#3E56D1');
  static Color secondGradientColor = hexToColor('#5E92F3');
  static Color secondaryDarkAppColor = Colors.white;
}
