import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../config/router.dart';
import '../../config/routes.dart';
import '../../core/enums/enums.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme;

    void switchBranch(BuildContext context, int index) {
      final navigationShell = ref.read(navigationShellProvider);
      if (navigationShell != null) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
          //
          title: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: 'Wuthering', style: textTheme.titleLarge),
            TextSpan(
              text: ' Tools',
              style: textTheme.titleLarge!.copyWith(color: Colors.yellowAccent),
            ),
          ],
        ),
      )),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  context.goNamed(Routes.character);
                },
                child: buildCard(
                    textTheme,
                    'https://wuthering.gg/_ipx/q_70&s_200x200/images//IconChatEmoticon/T_ChatEmo_F_01.png',
                    'Characters'),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  // context.goNamed(Routes.character);
                  switchBranch(context, 0);
                },
                child: buildCard(textTheme,
                    'https://wuthering.gg/_ipx/q_70&s_200x200/images//IconChatEmoticon/T_ChatEmo_B_03.png', 'Echoes'),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  // context.goNamed(Routes.character);
                  switchBranch(context, 1);
                },
                child: buildCard(textTheme, 'https://wuthering.gg/_ipx/q_70&s_200x200/images//IconChatEmoticon/T_ChatEmo_K_03.png', 'Weapons'),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  context.goNamed(Routes.character);
                  switchBranch(context, 3);
                },
                child: buildCard(textTheme, 'https://wuthering.gg/_ipx/q_70&s_200x200/images//IconChatEmoticon/T_ChatEmo_H_01.png', 'Items'),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Center buildCard(TextTheme textTheme, String imageUrl, String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            height: 120,
            width: 120,
            imageUrl: imageUrl,
          ),
          Text(
            title,
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
