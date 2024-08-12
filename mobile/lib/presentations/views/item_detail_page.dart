import 'package:flutter/material.dart';
import 'package:mobile/domains/item/item_entity.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key, required this.id, required this.itemEntity});

  final int id;
  final ItemEntity itemEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(id.toString()),
      ),
      body:  Center(
        child: Text(itemEntity.name!),
      ),
    );
  }
}
