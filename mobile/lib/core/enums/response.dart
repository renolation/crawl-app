enum WeaponType {
  Any('Any', ''),
  Broadblade('Broadblade','https://wuthering.gg/_ipx/q_70&s_64x64/images//IconSkill/SP_IconNorSword.png'),
  Gauntlets('Gauntlets', 'https://wuthering.gg/_ipx/q_70&s_64x64/images//IconSkill/SP_IconNorFist.png'),
  Pistols('Pistols','https://wuthering.gg/_ipx/q_70&s_64x64/images//IconSkill/SP_IconNorGun.png'),
  Rectifier('Rectifier','https://wuthering.gg/_ipx/q_70&s_64x64/images//IconSkill/SP_IconNorMagic.png'),
  Sword('Sword','https://wuthering.gg/_ipx/q_70&s_64x64/images//IconSkill/SP_IconNorKnife.png');

  const WeaponType(this.value, this.imageUrl);

  final String value;
  final String imageUrl;
}

enum CharacterRarity {
  any('Any', 0, 'ffffff'),
  fourStars('4 Stars', 4, 'c96dff'),
  fiveStars('5 Stars', 5, 'ffd66b');

  const CharacterRarity(this.name, this.value, this.color);

  final String name;
  final int value;
  final String color;
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
