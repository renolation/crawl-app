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
                    final topStats = getNonNullProperties(characterLevelEntity);

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
                        SizedBox(height: 8),
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
                        SizedBox(height: 8),
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
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                        Text('Main Stat'),
                        for (var property in topStats) Text(property),
                        Wrap(
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
