import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/extensions/extensions.dart';

import '../../config/routes.dart';
import '../../domains/weapon/weapon_entity.dart';

class WeaponCard extends StatelessWidget {
  const WeaponCard({
    super.key,
    required this.weaponEntity,
  });

  final WeaponEntity weaponEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(weaponEntity.name!);
        context.pushNamed(
          Routes.weaponDetail.name,
          pathParameters: {'id': weaponEntity.id!.toString()},
          extra: weaponEntity,
        );

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: getWeaponColor(weaponEntity), width: 2),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(weaponEntity.imageUrl!.withUrlCheck()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          Container(
            height: 4,
            width: double.infinity,
            color: getWeaponColor(weaponEntity),
          ),
          Expanded(
            child: Center(
              child: Text(
              weaponEntity.name!,
              style: Theme.of(context).textTheme.bodyLarge,),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
