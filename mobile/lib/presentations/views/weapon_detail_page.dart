import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/extensions.dart';
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
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
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
              WeaponLevelRankEntity weaponLevelRankEntity = data.weaponLevelRank!
                  .where((element) =>
                      element.level == levelSlider.value.toInt() && element.rank == rankSlider.value.toInt())
                  .single;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                color: theme.colorScheme.primary,
                                child: CachedNetworkImage(
                                  imageUrl: data.imageUrl!.withUrlCheck(),
                                ),
                              )),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name!,
                                    style: textTheme.headlineLarge!.copyWith(color: getWeaponColor(weaponEntity)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.onPrimary,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${weaponLevelRankEntity.stat1Name!}: '),
                                        Text(
                                          weaponLevelRankEntity.stat1Value.toString(),
                                          style: TextStyle(color: Color(0xffa4b2fa)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.onSecondary,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${weaponLevelRankEntity.stat2Name!}: '),
                                        Text(
                                          weaponLevelRankEntity.stat2Value.toString(),
                                          style: TextStyle(color: Color(0xffa4b2fa)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),

                      //region slider
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Level: ', style: textTheme.bodyLarge),
                            Text(levelSlider.value.toStringAsFixed(0), style: textTheme.bodyLarge),
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                            trackShape: const RoundedRectSliderTrackShape(),
                            trackHeight: 4,
                            activeTrackColor: Colors.yellow,
                            thumbColor: theme.colorScheme.primary),
                        child: Slider(
                          min: 1.0,
                          max: 90.0,
                          value: levelSlider.value,
                          divisions: 89,
                          onChanged: (value) {
                            levelSlider.value = value.roundToDouble();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Rank: ', style: textTheme.bodyLarge),
                            Text(rankSlider.value.toStringAsFixed(0), style: textTheme.bodyLarge),
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                            trackShape: const RoundedRectSliderTrackShape(),
                            trackHeight: 4,
                            activeTrackColor: Colors.yellow,
                            thumbColor: theme.colorScheme.primary),
                        child: Slider(
                          min: 1.0,
                          max: 5.0,
                          value: rankSlider.value,
                          divisions: 4,
                          onChanged: (value) {
                            rankSlider.value = value.roundToDouble();
                          },
                        ),
                      ),
                      //endregion
                      SizedBox(height: 8.0),

                      Text(
                        'Ascension Max Level ${weaponLevelRankEntity.ascensionMaxLevel}',
                        style: textTheme.bodyLarge,
                      ),
                      SizedBox(height: 18.0),
                      Center(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 10,
                          children: [
                            for (int i = 0; i < weaponLevelRankEntity.itemCounts!.length; i++)
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
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        CachedNetworkImage(
                                          imageUrl: weaponLevelRankEntity.items![i].imageUrl!.withUrlCheck(),
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
                                                weaponLevelRankEntity.items![i].name!,
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
                                          weaponLevelRankEntity.itemCounts![i].toString(),
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
                      ),

                      SizedBox(height: 8.0),

                      Text(
                        'Skill',
                        style: textTheme.titleLarge,
                      ),
                      SizedBox(height: 8.0),

                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
                                height: 30,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.inversePrimary,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                ),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      weaponLevelRankEntity.skills![0].name!,
                                      style: textTheme.bodyLarge,
                                    ))),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),

                              child: HtmlWidget(
                                '''
                            ${weaponLevelRankEntity.skills![0].value!}
                                                       ''',
                                customStylesBuilder: (element) {
                                  if (element.localName == 'span') {
                                    return {'color': '#a4b2fa'};
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'About',
                        style: textTheme.titleLarge,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                           borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(weaponLevelRankEntity.about!)),
                    ],
                  ),
                ),
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
