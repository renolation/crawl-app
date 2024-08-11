import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/providers/character_controller.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';
import 'package:mobile/domains/character/character_entity.dart';

import '../../config/router.dart';

class CharacterPage extends ConsumerWidget {
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
                        return CachedNetworkImage(
                            height: 100, width: 100, imageUrl: 'https://wuthering.gg${data[index].imageUrl!}');
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
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      CharacterEntity character = data[index];
                      return Text(character.name!);
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
