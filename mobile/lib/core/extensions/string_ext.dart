import 'package:flutter/material.dart';

import '../../domains/weapon/weapon_entity.dart';
import '../enums/enums.dart';

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

Color getWeaponColor(WeaponEntity weaponEntity) {
  WeaponRarity? matchingRarity = WeaponRarity.values.firstWhere(
        (rarity) => rarity.value == weaponEntity.rank,
    orElse: () => WeaponRarity.any,
  );
  return hexStringToColor(matchingRarity.color);
}