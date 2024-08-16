import 'package:flutter/material.dart';

extension StringExtension on String {
  String withUrlCheck() {
    if (!startsWith('https')) {
      return 'https://wuthering.gg/$this';
    }
    return this;
  }
}

Color hexStringToColor(String hex) {
  return Color(int.parse('0xff$hex'));
}