import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/core/extensions/extensions.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/domains/weapon/weapon_entity.dart';

import '../../config/routes.dart';
import '../../core/enums/enums.dart';
import '../../providers/providers.dart';
import '../widgets/title_widget.dart';
import '../widgets/weapon_card.dart';

class WeaponPage extends HookConsumerWidget {
  const WeaponPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    final rarity = useState(WeaponRarity.any);
    final weaponType = useState(WeaponType.Any);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const TitleWidget(text: 'Weapons'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
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
                      ref.read(searchWeaponProvider.notifier).state = newText;
                    },
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Rarity'),
                    DropdownButton<WeaponRarity>(
                      value: rarity.value,
                      underline: Container(),
                      onChanged: (value) {
                        rarity.value = value!;
                      },
                      items: [
                        for (WeaponRarity weaponRarity in WeaponRarity.values)
                          DropdownMenuItem(
                            value: weaponRarity,
                            child: Text(weaponRarity.name),
                          )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Weapon Type'),
                    DropdownButton<WeaponType>(
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
              ],
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final weaponsData = ref.watch(fetchWeaponsProvider);
            final searchText = ref.watch(searchWeaponProvider);

            return weaponsData.when(
              data: (data) {
                List<WeaponEntity> listWeapons = weaponType.value == WeaponType.Any
                    ? data
                    : data.where((weapon) => weapon.type == weaponType.value).toList();

                if (searchText != '') {
                  listWeapons = listWeapons
                      .where((element) => element.name!.toLowerCase().contains(searchText.toLowerCase()))
                      .toList();
                }
                if (rarity.value != WeaponRarity.any) {
                  listWeapons = listWeapons.where((element) => element.rank! == rarity.value.value).toList();
                }
                return SliverPadding(
                  padding: const EdgeInsets.all(12),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.67,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        WeaponEntity weaponEntity = listWeapons[index];
                        return WeaponCard(weaponEntity: weaponEntity);
                      },
                      childCount: listWeapons.length,
                    ),
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

