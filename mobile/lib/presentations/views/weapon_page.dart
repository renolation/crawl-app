import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/core/extensions/extensions.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';

class WeaponPage extends HookConsumerWidget {
  const WeaponPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weapon Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final weaponsData = ref.watch(fetchWeaponsProvider);
              return switch (weaponsData) {
                AsyncData(:final value) => GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Stack(
                          children: [
                            Image.network(
                              value[index].imageUrl!.withUrlCheck(),
                              height: 100,
                              width: 100,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                child: Text(
                                  value[index].name!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                AsyncError(:final error) => Text('Error $error'),
                _ => const Center(child: CircularProgressIndicator()),
              };
            }),
          )
        ],
      ),
    );
  }
}
