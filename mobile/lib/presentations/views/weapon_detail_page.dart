import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/domains/weapon/weapon_level_rank_entity.dart';
import '../../data/providers/fetch_detail.dart';
import '../../domains/weapon/weapon_entity.dart';

class WeaponDetailPage extends HookConsumerWidget {
  const WeaponDetailPage({super.key, required this.id, required this.weaponEntity});

  final int id;
  final WeaponEntity weaponEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //level 1-90
    //rank 1-5

    final levelSlider = useState(1.0);
    final rankSlider = useState(1.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(weaponEntity.name!),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final weapon = ref.watch(fetchWeaponByIdProvider(id: weaponEntity.id!));
          return weapon.when(
            data: (data) {
              WeaponLevelRankEntity weaponLevelRankEntity =
                  data.weaponLevelRank!.where((element) => element.level == levelSlider.value.toInt() && element.rank == rankSlider.value.toInt()).single;
              print(weaponLevelRankEntity.toString());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.name!),
                  Text(data.type!.name),
                  Text(levelSlider.value.toString()),

                  Slider(
                    min: 1.0,
                    max: 90.0,
                    value: levelSlider.value,
                    divisions: 89,
                    onChanged: (value) {
                      levelSlider.value = value.roundToDouble();
                    },
                  ),
                  Text(rankSlider.value.toString()),
                  Slider(
                    min: 1.0,
                    max: 5.0,
                    value: rankSlider.value,
                    divisions: 89,
                    onChanged: (value) {
                      rankSlider.value = value.roundToDouble();
                    },
                  ),
                  Text('${weaponLevelRankEntity.stat1Name!}: ${weaponLevelRankEntity.stat1Value}'),
                  Text('${weaponLevelRankEntity.stat2Name!}: ${weaponLevelRankEntity.stat2Value}'),

                  Text('Ascension Max Level'),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for(int i = 0; i< weaponLevelRankEntity.itemCounts!.length; i++)
                        Container(
                          width: 100,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(weaponLevelRankEntity.itemCounts![i].toString()),
                              Text(weaponLevelRankEntity.items![i].name!),
                            ],
                          ),
                        )
                    ],
                  ),

                  Spacer(),
                  Text('Skill'),
                  Text(weaponLevelRankEntity.skills![0].name!),
                  Text(weaponLevelRankEntity.skills![0].value!),
                  Text('About'),
                  Text(weaponLevelRankEntity.about!),
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
