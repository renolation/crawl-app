import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/domains/character/character_entity.dart';
import 'package:mobile/domains/weapon/weapon_level_rank_entity.dart';
import '../../data/providers/fetch_detail.dart';
import '../../domains/weapon/weapon_entity.dart';

class CharacterDetailPage extends HookConsumerWidget {
  const CharacterDetailPage(
      {super.key, required this.id, required this.characterEntity});

  final int id;
  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final levelSlider = useState(1.0);


    return Scaffold(
      appBar: AppBar(
        title: Text(characterEntity.name!),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final weapon = ref.watch(fetchCharacterByIdProvider(id: characterEntity.id!));
          return weapon.when(
            data: (data) {
              // WeaponLevelRankEntity weaponLevelRankEntity =
              //     data.weaponLevelRank!.where((element) => element.level == levelSlider.value.toInt() && element.rank == rankSlider.value.toInt()).single;
              // print(weaponLevelRankEntity.toString());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.name!),
                  // Text(data.type!.name),
                  // Text(levelSlider.value.toString()),

                  Slider(
                    min: 1.0,
                    max: 90.0,
                    value: levelSlider.value,
                    divisions: 89,
                    onChanged: (value) {
                      levelSlider.value = value.roundToDouble();
                    },
                  ),


                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
          );
        }),
      ),
    );
  }
}