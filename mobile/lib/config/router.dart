import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/config/routes.dart';
import 'package:mobile/domains/character/character_entity.dart';
import 'package:mobile/domains/echo/echo_entity.dart';
import 'package:mobile/presentations/views/character_detail_page.dart';
import 'package:mobile/presentations/views/character_page.dart';
import 'package:mobile/presentations/views/echo_detail_page.dart';
import 'package:mobile/presentations/views/echo_page.dart';
import 'package:mobile/presentations/views/home_page.dart';
import 'package:mobile/presentations/views/weapon_detail_page.dart';
import 'package:mobile/presentations/views/item_page.dart';
import 'package:mobile/presentations/views/weapon_page.dart';

// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../domains/weapon/weapon_entity.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.home,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(navigatorKey: _sectionANavigatorKey, routes: [
              GoRoute(
                  path: Routes.home,
                  name: Routes.home,
                  builder: (context, state) => const HomePage(),
                  routes: [
                    GoRoute(
                      path: Routes.character,
                      name: Routes.character,
                      builder: (context, state) => const CharacterPage(),
                      routes: [
                        GoRoute(
                      path: 'character/:id',
                      name: Routes.characterDetail.name,
                      builder: (context, state) {
                        int id = int.parse(state.pathParameters['id']!);
                        CharacterEntity character = state.extra as CharacterEntity;
                        return CharacterDetailPage(
                          key: state.pageKey,
                          id: id,
                          characterEntity: character,
                        );
                      },
                    ),
                      ]
                    ),

                  ]
              ),

              // GoRoute(
              //   path: '/detail/:slug',
              //   name: AppRoute.detail.name,
              //   builder: (context, state) {
              //     String slug = state.pathParameters['slug']!;
              //     String name = state.extra as String;
              //     return DetailScreen(
              //         key: state.pageKey, slug: slug, name :name);
              //   },
              // ),
            ]),

            StatefulShellBranch(routes: [
              GoRoute(
                path: Routes.echo,
                name: Routes.echo,
                builder: (context, state) => const EchoPage(),
                  routes: [
                    GoRoute(
                      path: 'echo/:id',
                      name: Routes.echoDetail.name,
                      builder: (context, state) {
                        int id = int.parse(state.pathParameters['id']!);
                        EchoEntity echo = state.extra as EchoEntity;
                        return EchoDetailPage(
                          key: state.pageKey,
                          id: id,
                          echoEntity: echo,
                        );
                      },
                    ),
                  ]
              ),
            ]),

            StatefulShellBranch(routes: [
              GoRoute(
                path: Routes.weapon,
                name: Routes.weapon,
                builder: (context, state) => const WeaponPage(),
                  routes: [
                    GoRoute(
                      path: 'weapon/:id',
                      name: Routes.weaponDetail.name,
                      builder: (context, state) {
                        int id = int.parse(state.pathParameters['id']!);
                        WeaponEntity weapon = state.extra as WeaponEntity;
                        return WeaponDetailPage(
                          key: state.pageKey,
                          id: id,
                          weaponEntity: weapon,
                        );
                      },
                    ),
                  ]),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: Routes.item,
                name: Routes.item,
                builder: (context, state) => const ItemPage(),

              ),
            ]),
          ]),
    ],
  );
});

class ScaffoldWithNavBar extends ConsumerWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future(() {
      ref.read(navigationShellProvider.notifier).state = navigationShell;
    });
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
            child: SalomonBottomBar(
              selectedItemColor: Colors.blueAccent,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(FontAwesomeIcons.house),
                  title: const Text('Home'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(FontAwesomeIcons.heart),
                  title: const Text('Echo'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(FontAwesomeIcons.gun),
                  title: const Text('Weapon'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(FontAwesomeIcons.gun),
                  title: const Text('Item'),
                ),

              ],
              currentIndex: navigationShell.currentIndex,
              onTap: (index) {
                _onTap(context, index);
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

final navigationShellProvider = StateProvider<StatefulNavigationShell?>((ref) => null);
