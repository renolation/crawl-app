import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/core/extensions/extensions.dart';
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
    final ThemeData theme = Theme.of(context);

    final rankSlider = useState(2.0);
    final levelSlider = useState(0.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(echoEntity.name!),
      ),
      body: Center(child: Consumer(builder: (context, ref, child) {
        final echo = ref.watch(fetchEchoByIdProvider(id: echoEntity.id!));
        return echo.when(
          data: (data) {
            EchoLevelRankEntity echoLevelRankEntity = data.echoLevelRank!
                .where(
                    (element) => element.level == levelSlider.value.toInt() && element.rank == rankSlider.value.toInt())
                .single;
            EchoAbility echoAbility =
                data.echoAbility!.where((element) => element.rank == rankSlider.value.toInt()).single;
            final mainStats = getProperties(echoLevelRankEntity.echoMainStatEntity!);
            final subStats = getProperties(data.echoSubStat!);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Overlord Class'),
                                    Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.onPrimary,
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Text('Cost: ${data.cost!.toString()}')),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text('Rank: '),
                                    Text(rankSlider.value.toStringAsFixed(0)),
                                  ],
                                ),
                                Slider(
                                  label: rankSlider.value.toStringAsFixed(0),
                                  min: 2.0,
                                  max: 5.0,
                                  value: rankSlider.value,
                                  divisions: 3,
                                  onChanged: (value) {
                                    rankSlider.value = value.roundToDouble();
                                  },
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text('Level: '),
                                    Text(levelSlider.value.toStringAsFixed(0)),
                                  ],
                                ),
                                Slider(
                                  label: levelSlider.value.toStringAsFixed(0),
                                  min: 0.0,
                                  max: 25.0,
                                  value: levelSlider.value,
                                  divisions: 25,
                                  onChanged: (value) {
                                    levelSlider.value = value.roundToDouble();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    //region stats

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'All Possible Main Stats',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          for (int i = 0; i < mainStats.length; i++)
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: i.isEven ? theme.colorScheme.onPrimary : theme.colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 13,
                                      child: AutoSizeText(
                                        mainStats.keys.elementAt(i),
                                        maxLines: 1,
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 7,
                                      child: Text(
                                        mainStats.values.elementAt(i),
                                        style: theme.textTheme.titleMedium!.copyWith(
                                          color: const Color(0xffa4b2fa),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sub-Stats Ranges',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          for (int i = 0; i < subStats.length; i++)
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: i.isEven ? theme.colorScheme.onPrimary : theme.colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 13,
                                      child: AutoSizeText(
                                        subStats.keys.elementAt(i),
                                        maxLines: 1,
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 7,
                                      child: Text(
                                        subStats.values.elementAt(i),
                                        style: theme.textTheme.titleMedium!.copyWith(
                                          color: const Color(0xffa4b2fa),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //endregion

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.inversePrimary,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Echo Ability',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text('Rank: ${echoAbility.rank}'),
                              ],
                            ),
                          ),
                          HtmlWidget(
                            '''
                            ${echoAbility.value}
                         ''',
                            customStylesBuilder: (element) {
                              if (element.localName == 'span') {
                                return {'color': '#a4b2fa'};
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),

                    const Text(
                      'Possible Sonata Effect',
                    ),
                    for (var sonataEffect in data.sonataEffects!)
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              height: 35,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.inversePrimary,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: hexStringToColor(sonataEffect.color!).withOpacity(0.2),
                                        // borderRadius: BorderRadius.circular(8),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: hexStringToColor(sonataEffect.color!), width: 3),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: sonataEffect.imageUrl!.withUrlCheck(),
                                      )),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    sonataEffect.name!,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: RichText(
                                  text: TextSpan(children: [
                                const TextSpan(text: '2-Set: ', style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),),
                                TextSpan(
                                  text: sonataEffect.two_set!,
                                ),
                              ])),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: RichText(
                                  text: TextSpan(children: [
                                const TextSpan(text: '5-Set: ', style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),),
                                TextSpan(
                                  text: sonataEffect.five_set!,
                                ),
                              ])),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
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
