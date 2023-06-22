import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_application/pages/basket/basket_page.dart';
import 'package:invite_application/pages/home/home_page.dart';
import 'package:invite_application/pages/main_page.dart';
import 'package:go_router/go_router.dart';

import 'common_setup/routes.dart';
import 'pages/category/bloc/category_bloc.dart';
import 'pages/category/category_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
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
                  pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: HomePage(),
                  ),
                ),
                GoRoute(
                  path: Routes.search,
                  pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: Container(),
                  ),
                ),
                GoRoute(
                  path: Routes.basket,
                  pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: const BasketPage(),
                  ),
                ),
                GoRoute(
                  path: Routes.account,
                  pageBuilder: (context, state) => NoTransitionPage<void>(
                    key: state.pageKey,
                    child: Container(),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: Routes.category,
              pageBuilder: (context, state) {
                return NoTransitionPage<void>(
                  key: state.pageKey,
                  child: CategoryPage(
                    title: state.queryParameters['title'] ?? '',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}