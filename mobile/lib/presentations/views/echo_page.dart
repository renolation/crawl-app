import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/core/enums/enums.dart';
import 'package:mobile/core/extensions/extensions.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';
import 'package:mobile/domains/echo/echo_entity.dart';
import 'package:mobile/providers/providers.dart';

import '../../data/providers/local_json_provider.dart';

class EchoPage extends HookConsumerWidget {
  const EchoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final sonataEffects = useState('All');
    final textEditingController = useTextEditingController();
    final echoCost = useState(EchoCost.any);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Echo Page'),
      ),
      body: Column(
        children: [
          Container(
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
                Container(
                  width: 100,
                  height: 100,
                  child: DropdownButton<EchoCost>(
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
                ),
              ],
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final sonataData = ref.watch(fetchSonataEffectProvider);
            return SizedBox(
              height: 100,
              child: switch (sonataData) {
                AsyncData(:final value) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        if(sonataEffects.value == 'All'){
                          sonataEffects.value = value[index].name!;
                        } else {
                          sonataEffects.value = 'All';
                        }
                      },
                      child: CachedNetworkImage(
                        height: 100,
                        color: Colors.red,
                        imageUrl: value[index].imageUrl!.withUrlCheck(),
                      ),
                    );
                  }),
                AsyncError(:final error) => Text('Error $error'),
                _ => const Center(child: CircularProgressIndicator()),
              },
            );
          }),
          Consumer(builder: (context, ref, child) {
            final echoes = ref.watch(fetchEchoesProvider);
            final searchText = ref.watch(searchEchoProvider);
            return echoes.when(
              data: (data) {

                List<EchoEntity> listEchoes = sonataEffects.value == 'All'
                ? data
                    : data.where((echo) => echo.sonataEffects!.any(
                        (element) => element.name == sonataEffects.value
                    )).toList();
                if (searchText != '') {
                  listEchoes = listEchoes
                      .where(
                          (element) => element.name!.toLowerCase().contains(searchText.toLowerCase()))
                      .toList();
                }

                if(echoCost.value != EchoCost.any){

                  switch(echoCost.value){
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
                return Expanded(
                  child: GridView.builder(
                    itemCount: listEchoes.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      EchoEntity echo = listEchoes[index];
                      return Card(
                          child: Column(
                            children: [
                              Text(echo.name!),
                              Row(
                                children: [
                                  for(var sonataEffect in echo.sonataEffects!)
                                    CachedNetworkImage(
                                      color: Colors.red,
                                      height: 30,
                                      imageUrl: sonataEffect.imageUrl!.withUrlCheck(),
                                    )
                                ],
                              ),
                              Text(echo.cost!.toString()),
                              CachedNetworkImage(
                                  height: 100,
                                  imageUrl: echo.imageUrl!.withUrlCheck()),
                            ],
                          ));
                    },
                  ),
                );
              },
              error: (err, stack) => Text('Error $err'),
              loading: () => Text('loading'),
            );
          })

        ],
      ),
    );
  }
}
