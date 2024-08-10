import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/config/routes.dart';
import 'package:mobile/ui/views/character_page.dart';
import 'package:mobile/ui/views/home_page.dart';

// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../core/enums/enums.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [

            StatefulShellBranch(routes: [
              GoRoute(
                path: '/breeding',
                name: 'AppRoute.breeding.name',
                builder: (context, state) => const HomePage(),
              ),
            ]),
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
                path: '/items',
                name: 'AppRoute.item.name',
                builder: (context, state) => const HomePage(),
                // routes: [
                //   GoRoute(
                //     path: ':slug',
                //     name: AppRoute.itemDetail.name,
                //     builder: (context, state) {
                //       // String slug = state.pathParameters['slug']!;
                //       ItemEntity item = state.extra as ItemEntity;
                //       return ItemDetailScreen(
                //           key: state.pageKey, itemEntity: item);
                //     },
                //   ),
                // ]
              ),
            ]),
          ]),
    ],
  );
});

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
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
                  title: const Text('Pals'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(FontAwesomeIcons.heart),
                  title: const Text('Breeding'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(FontAwesomeIcons.gun),
                  title: const Text('Items'),
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
