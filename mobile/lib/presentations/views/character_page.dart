import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/enums/enums.dart';
import 'package:mobile/core/extensions/string_ext.dart';
import 'package:mobile/data/providers/character_controller.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';
import 'package:mobile/domains/character/character_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/providers/providers.dart';

import '../../config/router.dart';
import '../../config/routes.dart';

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

    final elements = useState('All');
    final textEditingController = useTextEditingController();
    final weaponType = useState(WeaponType.Any);
    final rarity = useState(CharacterRarity.any);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Page'),
      ),
      body: Column(
        children: [
          TextField(
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
              ref.read(searchCharacterProvider.notifier).state = newText;
            },
          ),
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
                        return InkWell(
                          onTap: () {
                            if (elements.value == 'All') {
                              elements.value = data[index].name!;
                            } else {
                              elements.value = 'All';
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
            return Row(
              children: [
                DropdownButton<CharacterRarity>(
                  value: rarity.value,
                  onChanged: (value) {
                    rarity.value = value!;
                  },
                  items: [
                    for (CharacterRarity characterRarity in CharacterRarity.values)
                      DropdownMenuItem(
                        value: characterRarity,
                        child: Text(characterRarity.name),
                      )
                  ],
                ),
                DropdownButton<WeaponType>(
                  value: weaponType.value,
                  onChanged: (value) {
                    weaponType.value = value!;
                  },
                  items: [
                    for (WeaponType weaponType in WeaponType.values)
                      DropdownMenuItem(
                        value: weaponType,
                        child: Text(weaponType.name),
                      )
                  ],
                ),
              ],
            );
          }),
          Consumer(builder: (context, ref, child) {
            final character = ref.watch(characterControllerProvider);
            final searchText = ref.watch(searchCharacterProvider);
            return character.when(
              data: (data) {
                List<CharacterEntity> listCharacter = elements.value == 'All'
                    ? data
                    : data.where((character) => character.characterElement!.name == elements.value).toList();

                if (searchText != '') {
                  listCharacter = listCharacter
                      .where(
                          (element) => element.name!.toLowerCase().contains(searchText.toLowerCase()))
                      .toList();
                }
                if (rarity.value != CharacterRarity.any) {
                  listCharacter = listCharacter
                      .where((element) => element.rarity == (rarity.value == CharacterRarity.fourStars ? 4 : 5))
                      .toList();
                }

                if(weaponType.value != WeaponType.Any){
                  listCharacter = listCharacter
                      .where((element) => element.buble! == weaponType.value.name)
                      .toList();
                }

                return Expanded(
                  child: GridView.builder(
                    itemCount: listCharacter.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      CharacterEntity character = listCharacter[index];
                      return InkWell(
                         onTap: (){
                          context.pushNamed(
                            Routes.characterDetail.name,
                            pathParameters: {'id': character.id!.toString()},
                            extra: character,
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(character.name!),
                                  Text('${character.rarity?? 0}'),
                                  CachedNetworkImage(
                                      height: 30, imageUrl: 'https://wuthering.gg${character.characterElement!.imageUrl!}'),
                                ],
                              ),
                              CachedNetworkImage(imageUrl: 'https://wuthering.gg${character.imageUrl!}'),
                            ],
                          )
                    ));},
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