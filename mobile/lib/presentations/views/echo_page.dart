import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/core/enums/enums.dart';
import 'package:mobile/core/extensions/extensions.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';
import 'package:mobile/domains/echo/echo_entity.dart';
import 'package:mobile/providers/providers.dart';

import '../../config/routes.dart';
import '../../data/providers/local_json_provider.dart';
import '../widgets/echo_card.dart';
import '../widgets/title_widget.dart';

class EchoPage extends HookConsumerWidget {
  const EchoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sonataEffects = useState('All');
    final textEditingController = useTextEditingController();
    final echoCost = useState(EchoCost.any);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const TitleWidget(text: 'Echoes'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              filled: true,
                              isDense: true,
                              suffixIcon: const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Icon(FontAwesomeIcons.magnifyingGlass),
                              ),
                              fillColor: Colors.grey.withOpacity(0.4),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              )),
                          onChanged: (newText) {
                            textEditingController.text = newText;
                            textEditingController.selection =
                                TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));
                            ref.read(searchEchoProvider.notifier).state = newText;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      DropdownButton<EchoCost>(
                        underline: Container(),
                        value: echoCost.value,
                        onChanged: (value) {
                          echoCost.value = value!;
                        },
                        items: [
                          for (EchoCost echoCost in EchoCost.values)
                            DropdownMenuItem(
                              value: echoCost,
                              child: Text(echoCost.name),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(height: 10),
            Consumer(builder: (context, ref, child) {
              final sonataData = ref.watch(fetchSonataEffectProvider);
              return Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: switch (sonataData) {
                  AsyncData(:final value) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Sonata Effects',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (sonataEffects.value == value[index].name) {
                                      sonataEffects.value = 'All';
                                    } else {
                                      sonataEffects.value = value[index].name!;
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: sonataEffects.value != value[index].name
                                          ? Color(4281151295)
                                          : hexStringToColor(value[index].color!).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: sonataEffects.value != value[index].name
                                              ? Colors.black
                                              : hexStringToColor(value[index].color!),
                                          width: 3),
                                    ),
                                    child: CachedNetworkImage(
                                      color: Color(4291085785),
                                      height: 40,
                                      imageUrl: value[index].imageUrl!.withUrlCheck(),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  AsyncError(:final error) => Text('Error $error'),
                  _ => const Center(child: CircularProgressIndicator()),
                },
              );
            }),
          ])),
          Consumer(builder: (context, ref, child) {
            final echoes = ref.watch(fetchEchoesProvider);
            final searchText = ref.watch(searchEchoProvider);
            return echoes.when(
              data: (data) {
                List<EchoEntity> listEchoes = sonataEffects.value == 'All'
                    ? data
                    : data
                        .where((echo) => echo.sonataEffects!.any((element) => element.name == sonataEffects.value))
                        .toList();
                if (searchText != '') {
                  listEchoes = listEchoes
                      .where((element) => element.name!.toLowerCase().contains(searchText.toLowerCase()))
                      .toList();
                }

                if (echoCost.value != EchoCost.any) {
                  switch (echoCost.value) {
                    case EchoCost.any:
                      break;
                    case EchoCost.oneCost:
                      listEchoes = listEchoes.where((element) => element.cost == 1).toList();
                      break;
                    case EchoCost.threeCost:
                      listEchoes = listEchoes.where((element) => element.cost == 3).toList();
                    case EchoCost.fourCost:
                      listEchoes = listEchoes.where((element) => element.cost == 4).toList();
                  }
                }
                return SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 9 / 10),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      EchoEntity echo = listEchoes[index];
                      return EchoCard(echo: echo);
                    }, childCount: listEchoes.length),
                  ),
                );
              },
              error: (err, stack) => Text('Error $err'),
              loading: () => SliverToBoxAdapter(child: Text('loading')),
            );
          })
        ],
      ),
    );
  }
}
