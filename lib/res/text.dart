import 'package:everything_danle/res/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static final text = TextStyle().black.normal.s(14);
}

extension TextWeight on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);
}

extension TextColor on TextStyle {
  TextStyle get black => copyWith(color: AssetColors.Tundora);
}

extension TextSize on TextStyle {
  TextStyle s(double size) => copyWith(fontSize: size);
}
