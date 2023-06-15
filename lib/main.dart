import 'package:flutter/material.dart';
import 'package:invite_application/pages/basket/basket_page.dart';
import 'package:invite_application/pages/home/home_page.dart';
import 'package:invite_application/pages/main_page.dart';
import 'package:go_router/go_router.dart';

import 'common_setup/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: Routes.home,
        navigatorKey: _rootNavigatorKey,
        routes: [
          ShellRoute(
            builder: (context, state, child) => MainPage(
              location: state.location,
              child: child,
            ),
            routes: <RouteBase>[
              GoRoute(
                path: Routes.home,
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: HomePage(),
                ),
              ),
              GoRoute(
                path: Routes.search,
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: Placeholder(),
                ),
              ),
              GoRoute(
                path: Routes.basket,
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: BasketPage(),
                ),
              ),
              GoRoute(
                path: Routes.account,
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: Placeholder(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
