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

class WeaponPage extends HookConsumerWidget {
  const WeaponPage({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textEditingController = useTextEditingController();
    final rarity = useState(WeaponRarity.any);
    final weaponType = useState(WeaponType.Any);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weapon Page'),
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
              ref.read(searchWeaponProvider.notifier).state = newText;
            },
          ),
          Row(
            children: [
              DropdownButton<WeaponRarity>(
                value: rarity.value,
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
          ),
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final weaponsData = ref.watch(fetchWeaponsProvider);
              final searchText = ref.watch(searchWeaponProvider);

              return weaponsData.when(data: (data){
                List<WeaponEntity> listWeapons = weaponType.value == WeaponType.Any
                    ? data
                    : data.where((weapon) => weapon.type == weaponType.value).toList();

                if (searchText != '') {
                  listWeapons = listWeapons
                      .where(
                          (element) => element.name!.toLowerCase().contains(searchText.toLowerCase()))
                      .toList();
                }
                if (rarity.value != WeaponRarity.any) {
                  listWeapons = listWeapons
                      .where((element) => element.rank! == rarity.value.value)
                      .toList();
                }

                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: listWeapons.length,
                    itemBuilder: (context, index) {
                      WeaponEntity weaponEntity = listWeapons[index];
                      return InkWell(
                        onTap: (){
                          print(weaponEntity.name!);
                          context.pushNamed(
                            Routes.weaponDetail.name,
                            pathParameters: {'id': weaponEntity.id!.toString()},
                            extra: weaponEntity,
                          );
                        },
                        child: Card(
                          child: Stack(
                            children: [
                              Image.network(
                                weaponEntity.imageUrl!.withUrlCheck(),
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
                                    '${weaponEntity.name!}${weaponEntity.rank!}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
                error: (err, stack) => Text('Error $err'),
                loading: () => Text('loading'),
              );
            }),
          )
        ],
      ),
    );
  }
}
