import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/extensions/extensions.dart';

import '../../config/routes.dart';
import '../../domains/echo/echo_entity.dart';

class EchoCard extends StatelessWidget {
  const EchoCard({
    super.key,
    required this.echo,
  });

  final EchoEntity echo;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        print(echo.name!);
        context.pushNamed(
          Routes.echoDetail.name,
          pathParameters: {'id': echo.id!.toString()},
          extra: echo,
        );
      },
      child: Container(
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.secondaryContainer, width: 2),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 24,
                  decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer,
                      borderRadius:
                          const BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
                  child: Center(
                    child: Text(
                      echo.cost!.toString(),
                      style: TextStyle(color: colorScheme.secondary, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var sonataEffect in echo.sonataEffects!)
                        Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: hexStringToColor(sonataEffect.color!).withOpacity(0.2),
                            // borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.circle,
                            border: Border.all(color: hexStringToColor(sonataEffect.color!), width: 3),
                          ),
                          child: CachedNetworkImage(
                            // color: Colors.red,
                            height: 25,
                            imageUrl: sonataEffect.imageUrl!.withUrlCheck(),
                          ),
                        )
                    ],
                  )),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: echo.rarity! == 4
                            //     ? Color(0xffc96dff)
                            //     : Color(0xffffd56b),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(echo.imageUrl!.withUrlCheck()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      echo.name!,
                      style: textTheme.titleMedium,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
