import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/core/extensions/string_ext.dart';
import 'package:mobile/domains/character/character_entity.dart';
import 'package:mobile/domains/character/character_level_entity.dart';
import '../../data/providers/fetch_detail.dart';
import '../../utils/functions.dart';

class CharacterDetailPage extends HookConsumerWidget {
  const CharacterDetailPage({super.key, required this.id, required this.characterEntity});

  final int id;
  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelSlider = useState(1.0);
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Consumer(builder: (context, ref, child) {
                final character = ref.watch(fetchCharacterByIdProvider(id: characterEntity.id!));
                return character.when(
                  data: (data) {
                    final characterLevelEntity =
                        data.characterLevels!.firstWhere((element) => element.level == levelSlider.value.toInt());
                    final topStats = getProperties(characterLevelEntity);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                          height: 500,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(200),
                              topRight: Radius.circular(200),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                theme.colorScheme.secondary.withOpacity(0.7),
                                theme.colorScheme.primary.withOpacity(0.2)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft,
                            ),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(data.mainImageUrl!.withUrlCheck()),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.blue.withOpacity(0.5),
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                data.name!,
                                style: theme.textTheme.displaySmall!.copyWith(color: getCharacterColor(characterEntity)),
                              ),
                              Text(data.description!,  style: theme.textTheme.titleMedium!),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OutlinedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  minimumSize: WidgetStateProperty.all(Size(100, 40)),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                                  side: WidgetStateProperty.all(
                                    BorderSide(
                                        width: 3.0, color: theme.colorScheme.secondary), // Set the width of the border
                                  ),
                                  backgroundColor: WidgetStateProperty.all(theme.colorScheme.onPrimary),
                                ),
                                child: Text(data.buble!, style: const TextStyle(color: Colors.white),),
                              ),
                              OutlinedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  minimumSize: WidgetStateProperty.all(Size(140, 40)),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                                  side: WidgetStateProperty.all(
                                    BorderSide(
                                        width: 3.0, color: theme.colorScheme.secondary), // Set the width of the border
                                  ),
                                  backgroundColor: WidgetStateProperty.all(theme.colorScheme.onPrimary),
                                ),
                                child: Text(data.birthday!, style: const TextStyle(color: Colors.white),),
                              ),
                              OutlinedButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  minimumSize: WidgetStateProperty.all(Size(80, 40)),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                                  side: WidgetStateProperty.all(
                                    BorderSide(
                                        width: 3.0, color: theme.colorScheme.secondary), // Set the width of the border
                                  ),
                                  backgroundColor: WidgetStateProperty.all(theme.colorScheme.onPrimary),
                                ),
                                //todo: element
                                child: Text(data.buble!, style: const TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Text('Level', style: theme.textTheme.titleMedium!),
                              Spacer(),
                              Text(levelSlider.value.toStringAsPrecision(2),style:  theme.textTheme.titleMedium!),
                            ],
                          ),
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            trackShape: const RoundedRectSliderTrackShape(),
                            trackHeight: 4,
                            activeTrackColor: Colors.yellow,
                            thumbColor: theme.colorScheme.primary
                          ),
                          child: Slider(
                            min: 1.0,
                            max: 90.0,
                            value: levelSlider.value,
                            divisions: 89,
                            onChanged: (value) => levelSlider.value = value.roundToDouble(),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            for (int i = 0; i < characterLevelEntity.itemCounts!.length; i++)
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: theme.colorScheme.primaryContainer,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 8,),
                                        CachedNetworkImage(
                                          imageUrl: characterLevelEntity.items![i].imageUrl!.withUrlCheck(),
                                          // height: 70,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 120,
                                            height: 40,
                                            margin: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: theme.colorScheme.onPrimary,
                                              borderRadius: BorderRadius.circular(3),
                                            ),
                                            child: Center(
                                              child: AutoSizeText(
                                                characterLevelEntity.items![i].name!,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -10,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.onPrimary,
                                          borderRadius: BorderRadius.circular(6),
                                          border: Border.all(color: theme.colorScheme.primaryContainer, width: 2),
                                        ),
                                        child: Text(
                                          characterLevelEntity.itemCounts![i].toString(),
                                          style: TextStyle(
                                            color: theme.colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              for (int i = 0; i < topStats.length; i++)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: i.isEven ? theme.colorScheme.onPrimary : theme.colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(topStats.keys.elementAt(i), style: theme.textTheme.titleMedium,),
                                      Spacer(),
                                      Text(topStats.values.elementAt(i), style: theme.textTheme.titleMedium,),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ),


                      ],
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Error: $error'),
                );
              }),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(FontAwesomeIcons.chevronLeft),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
