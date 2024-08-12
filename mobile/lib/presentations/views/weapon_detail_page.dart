import 'package:flutter/material.dart';

import '../../domains/weapon/weapon_entity.dart';

class WeaponDetailPage extends StatelessWidget {
  const WeaponDetailPage({super.key, required this.id, required this.weaponEntity});

  final int id;
  final WeaponEntity weaponEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(id.toString()),
      ),
      body:  Center(
        child: Text(weaponEntity.name!),
      ),
    );
  }
}
