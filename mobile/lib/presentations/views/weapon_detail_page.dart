import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/providers/fetch_detail.dart';
import '../../domains/weapon/weapon_entity.dart';

class WeaponDetailPage extends HookConsumerWidget {
  const WeaponDetailPage({super.key, required this.id, required this.weaponEntity});

  final int id;
  final WeaponEntity weaponEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title:  Text(weaponEntity.name!),
      ),
      body:  Center(
        child: Consumer(builder: (context, ref, child) {
          final weapon = ref.watch(fetchWeaponByIdProvider(id: weaponEntity.id!));
          return weapon.when(
            data: (data) {
              return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(data.name!),
                   Text(data.type!.name),
                ],
              );
            },
            loading: () =>  const CircularProgressIndicator(),
            error: (error, stack) =>  Text('Error: $error'),
          );
        }),
      ),
    );
  }
}
