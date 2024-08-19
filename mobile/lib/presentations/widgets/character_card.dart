import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/extensions/extensions.dart';

import '../../config/routes.dart';
import '../../domains/character/character_entity.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
        onTap: (){
          context.pushNamed(
            Routes.characterDetail.name,
            pathParameters: {'id': character.id!.toString()},
            extra: character,
          );
        },
        child: Card(
            child: Container(
              color: theme.colorScheme.onPrimary,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: CachedNetworkImage(
                        height: 30, imageUrl: character.characterElement!.imageUrl!.withUrlCheck()),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 8,),
                        Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: character.rarity! == 4 ? Color(0xffc96dff) : Color(0xffffd56b),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 96,
                                height: 96,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(character.imageUrl!.withUrlCheck()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ),

                          ],
                        ),
                        SizedBox(height: 8,),
                        Text(character.name!, style: Theme.of(context).textTheme.titleMedium,),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ));
  }
}
