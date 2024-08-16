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
import 'package:mobile/presentations/widgets/item_card.dart';
import 'package:mobile/providers/providers.dart';

import '../../config/routes.dart';
import '../widgets/title_widget.dart';

class ItemPage extends HookConsumerWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    final rarity = useState(ItemRarity.all);
    final itemType = useState(ItemType.All);

    return Scaffold(
      appBar: AppBar(
        title: const TitleWidget(text: 'Items'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
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
                        width: 8,
                      ),
                      DropdownButton<ItemRarity>(
                        value: rarity.value,
                        underline: Container(),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                spacing: 4,
                children: [
                  for (ItemType item in ItemType.values)
                    ChoiceChip(
                      label: Text(item.name),
                      selected: item == itemType.value,
                      showCheckmark: false,
                      side: BorderSide(
                        color: item == itemType.value ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.inversePrimary, // Change border color based on selection
                        width: 2,
                      ),
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
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(height: 8),
          ),
          SliverToBoxAdapter(
            child: LayoutBuilder(builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final column1Width = (totalWidth-36) * 1 / 10;
              final column2Width = (totalWidth-36) * 4 / 10;
              final column3Width = (totalWidth-36) * 5 / 10;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: column1Width,
                      child: const Center(child: SizedBox())),
                  SizedBox(
                      width: column2Width,
                      child: const Center(child: Text('Name', style: TextStyle(fontSize: 18),))),
                  SizedBox(
                      width: column3Width,
                      child: const Center(child: Text('Description', style: TextStyle(fontSize: 18),))),
                ],
              );
            }),
          ),

          Consumer(builder: (context, ref, child) {
            final weaponsData = ref.watch(fetchItemsProvider);
            final searchText = ref.watch(searchItemProvider);

            return weaponsData.when(
              data: (data) {
                List<ItemEntity> listItems = itemType.value == ItemType.All
                    ? data
                    : data.where((item) => item.type! == itemType.value.value).toList();
                if (searchText != '') {
                  listItems =
                      listItems.where((item) => item.name!.toLowerCase().contains(searchText.toLowerCase())).toList();
                }
                if (rarity.value != ItemRarity.all) {
                  listItems = listItems.where((element) => element.rank == rarity.value.value).toList();
                }
                return SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      ItemEntity item = listItems[index];
                      return Column(
                        children: [
                          ItemCard(item: item),
                          if (index < listItems.length - 1) Divider(
                            height: 1,
                          ), // Add Divider between items

                        ],
                      );
                    }, childCount: listItems.length),
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
