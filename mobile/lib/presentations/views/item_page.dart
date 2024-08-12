import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/core/enums/enums.dart';
import 'package:mobile/core/extensions/extensions.dart';
import 'package:mobile/data/providers/fetch_character_elements.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/domains/item/item_entity.dart';
import 'package:mobile/providers/providers.dart';

import '../../config/routes.dart';
class ItemPage extends HookConsumerWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    final rarity = useState(ItemRarity.all);
    final itemType = useState(ItemType.All);


    return  Scaffold(
      appBar: AppBar(
        title: Text('Item Page'),
      ),
      body: Column(
        children: [
          Row(
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
                    ref.read(searchItemProvider.notifier).state = newText;
                  },
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: DropdownButton<ItemRarity>(
                  value: rarity.value,
                  onChanged: (value) {
                    rarity.value = value!;
                  },
                  items: [
                    for (ItemRarity itemRarity in ItemRarity.values)
                      DropdownMenuItem(
                        value: itemRarity,
                        child: Text(itemRarity.name),
                      )
                  ],
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              for (ItemType item in ItemType.values)
                ChoiceChip(
                  label: Text(item.name),
                  selected: item == itemType.value,
                  onSelected: (isSelected) {
                    if (isSelected) {
                      itemType.value = item;
                    } else {
                      itemType.value = ItemType.All;
                    }
                  },
                )
            ],
          ),
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final weaponsData = ref.watch(fetchItemsProvider);
              final searchText = ref.watch(searchItemProvider);

              return weaponsData.when(data: (data){

                List<ItemEntity> listItems = itemType.value == ItemType.All
                    ? data
                    : data.where((item) => item.type! ==  itemType.value.value).toList();
                if (searchText != '') {
                  listItems = listItems
                      .where(
                          (item) => item.name!.toLowerCase().contains(searchText.toLowerCase()))
                      .toList();
                }
                if (rarity.value != ItemRarity.all) {
                  listItems = listItems
                      .where((element) => element.rank == rarity.value.value)
                      .toList();
                }
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: listItems.length,
                    itemBuilder: (context, index) {
                      ItemEntity item = listItems[index];
                      return InkWell(
                        onTap: (){
                          print(item.name!);

                        },
                        child: Card(
                          child: Stack(
                            children: [
                              Image.network(
                                item.imageUrl!.withUrlCheck(),
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
                                    item.name! + ' ' + item.rank.toString() + ' ' + item.type!,
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
