
enum WeaponType {
  Broadblade,
  Gauntlets,
  Pistols,
  Rectifier,
  Sword,
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
