import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/extensions.dart';
import 'package:mobile/domains/item/item_entity.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
  });

  final ItemEntity item;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        print(item.name!);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final totalWidth = constraints.maxWidth;
          final column1Width = (totalWidth - 36) * 2 / 10;
          final column2Width = (totalWidth - 36) * 4 / 10;
          final column3Width = (totalWidth - 36) * 5 / 10;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: column1Width,
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl!.withUrlCheck(),
                  height: 70,
                  width: 70,
                ),
              ),
              SizedBox(
                  width: column2Width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name!,
                        maxLines: 2,
                        style: textTheme.titleSmall!.copyWith(
                          color: getItemColor(item),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        item.subTypes!,
                        style: textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
              SizedBox(
                width: column3Width,
                child: Text(
                  item.description!,
                  maxLines: 3,
                  style: textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
