import 'package:flutter/material.dart';
import 'package:mobile/domains/character/character_entity.dart';
import 'package:mobile/domains/item/item_entity.dart';

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

Color getItemColor(ItemEntity itemEntity) {
  ItemRarity? matchingRarity = ItemRarity.values.firstWhere(
        (rarity) => rarity.value == itemEntity.rank,
    orElse: () => ItemRarity.all,
  );
  return hexStringToColor(matchingRarity.color);
}

Color getCharacterColor(CharacterEntity characterEntity) {
  CharacterRarity? matchingRarity = CharacterRarity.values.firstWhere(
        (rarity) => rarity.value == characterEntity.rarity,
    orElse: () => CharacterRarity.any,
  );
  return hexStringToColor(matchingRarity.color);
}

String getWeaponImageUrl(String weaponName) {
  for (var weapon in WeaponType.values) {
    if (weapon.value == weaponName) {
      return weapon.imageUrl;
    }
  }
  return 'https://wuthering.gg/_ipx/q_70&s_64x64/images//IconSkill/SP_IconNorMagic.png'; // Return an empty string if no match is found
}