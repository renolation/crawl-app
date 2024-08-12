enum WeaponType {
  Any,
  Broadblade,
  Gauntlets,
  Pistols,
  Rectifier,
  Sword,
}

enum CharacterRarity {
  any('Any', 0),
  fourStars('4 Stars', 4),
  fiveStars('5 Stars', 5);

  const CharacterRarity(this.name, this.value);

  final String name;
  final int value;
}

enum ItemType {
  All('All'),
  DevelopmentMaterials('Development Materials'),
  Echoes('Echoes'),
  Missions('Missions'),
  Resources('Resources'),
  Supplies('Supplies'),
  Valuables('Valuables');

  const ItemType(this.value);

  final String value;
}
