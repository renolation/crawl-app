import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/extensions/string_ext.dart';
import 'package:mobile/data/providers/character_controller.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';
import 'package:mobile/domains/character/character_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../config/router.dart';

class CharacterPage extends HookConsumerWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void switchBranch(BuildContext context, int index) {
      final navigationShell = ref.read(navigationShellProvider);
      if (navigationShell != null) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      }
    }

    final searchItems = useState('All');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Character Page'),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final characterElements = ref.watch(fetchCharacterElementsProvider);
            return characterElements.when(
              data: (data) {
                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // return Text(data[index].name!);
                        return InkWell(
                          onTap: (){
                            if(searchItems.value == 'All'){
                              searchItems.value = data[index].name!;
                            } else {
                              searchItems.value = 'All';
                            }

                          },
                          child: CachedNetworkImage(
                              height: 100, width: 100, imageUrl: data[index].imageUrl!.withUrlCheck()),
                        );
                      }),
                );
              },
              error: (err, stack) => Text('Error $err'),
              loading: () => Text('loading'),
            );
          }),
          Consumer(builder: (context, ref, child) {
            final character = ref.watch(characterControllerProvider);
            return character.when(
              data: (data) {
                List<CharacterEntity> listCharacter= [];
                if (searchItems.value == 'All') {
                  listCharacter = data;
                } else {
                  listCharacter = data.where((character) => character.characterElement!.name == searchItems.value).toList();
                }
                return Expanded(
                  child: GridView.builder(
                    itemCount: listCharacter.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      CharacterEntity character = listCharacter[index];
                      return Card(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Text(character.name!),
                              CachedNetworkImage(
                                  height: 30,
                                  imageUrl: 'https://wuthering.gg${character.characterElement!.imageUrl!}'),
                            ],
                          ),
                          CachedNetworkImage(imageUrl: 'https://wuthering.gg${character.imageUrl!}'),
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
