import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_application/pages/basket/basket_page.dart';
import 'package:invite_application/pages/detail/detail_page.dart';
import 'package:invite_application/pages/home/home_page.dart';
import 'package:invite_application/pages/main_page.dart';
import 'package:go_router/go_router.dart';

import 'common_setup/routes.dart';
import 'models/dishes.dart';
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
    return BlocProvider(
      create: (context) => CategoryBloc(),
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
                  pageBuilder: (context, state) => MaterialPage<void>(
                    key: state.pageKey,
                    child: HomePage(),
                  ),
                ),
                GoRoute(
                  path: Routes.search,
                  pageBuilder: (context, state) => MaterialPage<void>(
                    key: state.pageKey,
                    child: Container(),
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
                    child: Container(),
                  ),
                ),
              ],
            ),
            // GoRoute(
            //   path: Routes.detail,
            //   pageBuilder: (context, state) => DialogPage(
            //     builder: (_) => DetailPage(
            //       id: state.queryParameters['id'] ?? '',
            //       imgUrl: state.queryParameters['imgUrl'] ?? '',
            //       title: state.queryParameters['title'] ?? '',
            //       cost: state.queryParameters['cost'] ?? '',
            //       weight: state.queryParameters['weight'] ?? '',
            //       description: state.queryParameters['description'] ?? '',
            //     ),
            //   ),
            // ),
            GoRoute(
              path: Routes.category,
              pageBuilder: (context, state) {
                return MaterialPage<void>(
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

class DetailPagePopUpRoute extends Page<void> {
  final WidgetBuilder builder;

  DetailPagePopUpRoute({required this.builder})
      : super(key: const ValueKey('DetailPage'));

  @override
  Route<void> createRoute(BuildContext context) {
    return CupertinoPageRoute<void>(
      settings: this,
      builder: (BuildContext context) {
        return CupertinoTheme(
          data: CupertinoThemeData(
            // Set the background color for the modal popup
            scaffoldBackgroundColor: Colors.black.withOpacity(0.5),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              // Set the brightness of the bottom navigation bar
              // to match the modal popup's background color
              brightness: Brightness.dark,
            ),
            child: builder(context),
          ),
        );
      },
    );
  }
}

// dialogpage.dart

class DialogPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final WidgetBuilder builder;

  const DialogPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black87,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: (context) => Dialog(
          child: builder(context),
        ),
        anchorPoint: anchorPoint,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        themes: themes,
      );
}
