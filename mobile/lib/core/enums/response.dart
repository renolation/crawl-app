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
  any('Any', 0, 'f0744e'),
  oneStars('1 Star', 1, 'D3D3D3'),
  twoStars('2 Stars', 2, '19EB5B'),
  threeStars('3 Stars', 3, '00B5FF'),
  fourStars('4 Stars', 4, 'CA6CFF'),
  fiveStars('5 Stars', 5, 'FFE659');

  const WeaponRarity(this.name, this.value, this.color);

  final String name;
  final int value;
  final String color;
}

enum ItemRarity {
  all('All', 0, 'f0744e'),
  oneStars('1 Star', 1, 'D3D3D3'),
  twoStars('2 Stars', 2, '19EB5B'),
  threeStars('3 Stars', 3, '00B5FF'),
  fourStars('4 Stars', 4, 'CA6CFF'),
  fiveStars('5 Stars', 5, 'FFE659');

  const ItemRarity(this.name, this.value, this.color);

  final String name;
  final int value;
  final String color;

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
