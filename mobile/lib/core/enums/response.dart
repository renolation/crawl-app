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

enum EchoCost {
  any('Any', 0),
  oneCost('1 Cost', 1),
  threeCost('3 Cost', 3),
  fourCost('4 Cost', 4);

  const EchoCost(this.name, this.value);

  final String name;
  final int value;
}

enum WeaponRarity {
  any('Any', 0),
  oneStars('1 Star', 1),
  twoStars('2 Stars', 2),
  threeStars('3 Stars', 3),
  fourStars('4 Stars', 4),
  fiveStars('5 Stars', 5);

  const WeaponRarity(this.name, this.value);

  final String name;
  final int value;
}

enum ItemRarity {
  all('All', 0),
  oneStars('1 Star', 1),
  twoStars('2 Stars', 2),
  threeStars('3 Stars', 3),
  fourStars('4 Stars', 4),
  fiveStars('5 Stars', 5);

  const ItemRarity(this.name, this.value);

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
