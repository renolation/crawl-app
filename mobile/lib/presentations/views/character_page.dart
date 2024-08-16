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

import '../../config/constants.dart';
import '../../config/router.dart';
import '../../config/routes.dart';
import '../widgets/character_card.dart';
import '../widgets/title_widget.dart';

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

    final elements = useState(characterElement);
    final textEditingController = useTextEditingController();
    final weaponType = useState(WeaponType.Any);
    final rarity = useState(CharacterRarity.any);

    return Scaffold(
      appBar: AppBar(
        title: const TitleWidget(text: 'Characters'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
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
                    ref.read(searchCharacterProvider.notifier).state = newText;
                  },
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Consumer(builder: (context, ref, child) {
                final characterElements = ref.watch(fetchCharacterElementsProvider);
                return characterElements.when(
                  data: (data) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rarity', style: Theme.of(context).textTheme.titleMedium),
                            DropdownButton<CharacterRarity>(
                              // isDense: true,
                              value: rarity.value,
                              itemHeight: 65,
                              underline: Container(),
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
                          ],
                        ),
                        SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Weapon', style: Theme.of(context).textTheme.titleMedium),
                            DropdownButton<WeaponType>(
                              itemHeight: 65,
                              value: weaponType.value,
                              underline: Container(),
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
                        ),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Element', style: Theme.of(context).textTheme.titleMedium),
                              SizedBox(
                                height: 65,
                                child: ListView.builder(
                                    itemCount: data.length,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          if (elements.value == characterElement) {
                                            elements.value = data[index].name!;
                                          } else {
                                            elements.value = characterElement;
                                          }
                                        },
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: CachedNetworkImage(
                                                fit: BoxFit.fitWidth,
                                                height: 40,
                                                width: 40,
                                                imageUrl: data[index].imageUrl!.withUrlCheck()),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  error: (err, stack) => Text('Error $err'),
                  loading: () => Text('loading'),
                );
              }),
            ),
            const SizedBox(
              height: 8,
            ),
          ])),
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

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),

                      delegate: SliverChildBuilderDelegate((context, index) {
                        CharacterEntity character = listCharacter[index];
                        return CharacterCard(character: character);
                      },childCount: listCharacter.length)),
                );
              },
              error: (err, stack) => Text('Error $err'),
              loading: () => const SliverToBoxAdapter(child: Text('loading')),
            );
          })

        ],
      ),
    );
  }
}

