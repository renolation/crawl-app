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
        title: const Text('Home Page'),
      ),
      body: Center(
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
                  // switchBranch(context, 2);
                },
                child:  Center(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: 100,
                        width: 100,
                        imageUrl: 'https://wuthering.gg/_ipx/q_70&s_200x200/images//IconChatEmoticon/T_ChatEmo_F_01.png',
                      ),
                      const Text('Character'),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  // context.goNamed(Routes.character);
                  switchBranch(context, 1);
                },
                child:  Center(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: 100,
                        width: 100,
                        imageUrl: 'https://wuthering.gg/_ipx/q_70&s_200x200/images//IconChatEmoticon/T_ChatEmo_B_03.png',
                      ),
                      const Text('Echoes'),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  // context.goNamed(Routes.character);
                  switchBranch(context, 2);
                },
                child:  Center(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: 100,
                        width: 100,
                        imageUrl: 'https://wuthering.gg/_ipx/q_70&s_200x200/images//IconChatEmoticon/T_ChatEmo_K_03.png',
                      ),
                      const Text('Weapons'),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  context.goNamed(Routes.character);
                  switchBranch(context, 3);
                },
                child:  Center(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: 100,
                        width: 100,
                        imageUrl: 'https://wuthering.gg/_ipx/q_70&s_200x200/images//IconChatEmoticon/T_ChatEmo_H_01.png',
                      ),
                      const Text('Items'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
