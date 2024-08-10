import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';

class CharacterPage extends ConsumerWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Character Page'),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
          final characterElements = ref.watch(fetchCharacterElementsProvider);
          return characterElements.when(data: (data) {
            // return Text(data.length.toString());
            return Expanded(
              child: ListView.builder(
                itemCount: data.length,
                  itemBuilder: (context, index){
                  // return Text(data[index].name!);
                return ListTile(
                  title: Text(data[index].name!),
                  subtitle: CachedNetworkImage(
                      height: 100,
                      width: 100,
                      imageUrl: 'https://wuthering.gg${data[index].imageUrl!}'

                  ),
                );
              }),
            );
          },
            error: (err, stack) => Text('Error $err'),
            loading: () => Text('loading'),
          );
                  }),
        ],
      ),
    );
  }
}
