import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/core/extensions/extensions.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';
import 'package:mobile/domains/echo/echo_entity.dart';

import '../../data/providers/local_json_provider.dart';

class EchoPage extends HookConsumerWidget {
  const EchoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final searchItems = useState('All');


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Echo Page'),
      ),
      body: Column(
        children: [
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
                        if(searchItems.value == 'All'){
                          searchItems.value = value[index].name!;
                        } else {
                          searchItems.value = 'All';
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
            final character = ref.watch(fetchEchoesProvider);
            return character.when(
              data: (data) {
                List<EchoEntity> listEchoes= [];
                if (searchItems.value == 'All') {
                  listEchoes = data;
                } else {
                  listEchoes = data.where((echo) => echo.sonataEffects!.any(
                      (element) => element.name == searchItems.value
                  )).toList();
                }
                return Expanded(
                  child: GridView.builder(
                    itemCount: listEchoes.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      EchoEntity character = listEchoes[index];
                      return Card(
                          child: Column(
                            children: [
                              Text(character.name!),
                              Row(
                                children: [
                                  for(var sonataEffect in character.sonataEffects!)
                                    CachedNetworkImage(
                                      color: Colors.red,
                                      height: 30,
                                      imageUrl: sonataEffect.imageUrl!.withUrlCheck(),
                                    )
                                ],
                              ),
                              CachedNetworkImage(
                                  height: 100,
                                  imageUrl: character.imageUrl!.withUrlCheck()),
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
