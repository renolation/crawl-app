import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/string_ext.dart';
import 'package:mobile/domains/character/character_entity.dart';
import 'package:mobile/domains/character/character_level_entity.dart';
import 'package:mobile/domains/weapon/weapon_level_rank_entity.dart';
import '../../data/providers/fetch_detail.dart';
import '../../domains/weapon/weapon_entity.dart';
import '../../utils/functions.dart';

class CharacterDetailPage extends HookConsumerWidget {
  const CharacterDetailPage({super.key, required this.id, required this.characterEntity});

  final int id;
  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelSlider = useState(1.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(characterEntity.name!),
      ),
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, child) {
          final weapon = ref.watch(fetchCharacterByIdProvider(id: characterEntity.id!));
          return weapon.when(
            data: (data) {
              CharacterLevelEntity characterLevelEntity =
                  data.characterLevels!.where((element) => element.level == levelSlider.value.toInt()).single;
              List<String> topStats = getNonNullProperties(characterLevelEntity);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                      height: 300,
                      imageBuilder: (context, imageProvider) {
                        print('rebuild 1');
                        return Image(image: imageProvider);
                      },
                      imageUrl: data.mainImageUrl!.withUrlCheck()),
                  Text(data.buble!),
                  Text(data.birthday!),
                  Text(data.description!),
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
                  Text('Main Stat'),
                  for (var property in topStats) Text(property),
                  Wrap(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < characterLevelEntity.itemCounts!.length; i++)
                        Container(
                          width: 100,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(characterLevelEntity.itemCounts![i].toString()),
                              Text(characterLevelEntity.items![i].name!),
                            ],
                          ),
                        )
                    ],
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
