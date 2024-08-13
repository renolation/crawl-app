import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/domains/echo/echo_ability.dart';
import 'package:mobile/domains/echo/echo_entity.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/domains/echo/echo_level_rank_entity.dart';

import '../../data/providers/fetch_detail.dart';
import '../../utils/functions.dart';

class EchoDetailPage extends HookConsumerWidget {
  const EchoDetailPage({
    super.key,
    required this.id,
    required this.echoEntity,
  });

  final int id;
  final EchoEntity echoEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //rank 2-5
    //level 0-25

    final rankSlider = useState(2.0);
    final levelSlider = useState(0.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Echo Detail'),
      ),
      body: Center(child: Consumer(builder: (context, ref, child) {
        final echo = ref.watch(fetchEchoByIdProvider(id: echoEntity.id!));
        return echo.when(
          data: (data) {
            EchoLevelRankEntity echoLevelRankEntity = data.echoLevelRank!
                .where(
                    (element) => element.level == levelSlider.value.toInt() && element.rank == rankSlider.value.toInt())
                .single;
            EchoAbility echoAbility = data.echoAbility!.where((element) => element.rank == rankSlider.value.toInt()).single;
            List<String> mainStats = getNonNullProperties(echoLevelRankEntity.echoMainStatEntity!);
            List<String> subStats = getNonNullProperties(data.echoSubStat!);
            print(data.sonataEffects);

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.name!),
                  Text(data.cost!.toString()),
                  Slider(
                    label: rankSlider.value.toString(),
                    min: 2.0,
                    max: 5.0,
                    value: rankSlider.value,
                    divisions: 3,
                    onChanged: (value) {
                      rankSlider.value = value.roundToDouble();
                    },
                  ),
                  Slider(
                    label: levelSlider.value.toString(),
                    min: 0.0,
                    max: 25.0,
                    value: levelSlider.value,
                    divisions: 25,
                    onChanged: (value) {
                      levelSlider.value = value.roundToDouble();
                    },
                  ),
                  //region stats
                  Text('Main Stat'),
                  for (var property in mainStats) Text(property),
                  Text('Sub Stat'),
                  for (var property in subStats) Text(property),
                  //endregion

                  Text('Ability'),
                  Text(echoAbility.rank!.toString()),
                  Text(echoAbility.value!),

                  Text('Sonata Effects'),
                  for (var sonataEffect in data.sonataEffects!) Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(sonataEffect.name!),
                      Text(sonataEffect.two_set!),
                      Text(sonataEffect.five_set!),
                    ],
                  ),
                ],
              ),
            );
          },
          error: (err, stack) => Text('Error $err'),
          loading: () => Text('loading'),
        );
      })),
    );
  }
}
