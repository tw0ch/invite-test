import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invite_application/pages/basket/basket_page.dart';
import 'package:invite_application/pages/home/detail/detail_page.dart';
import 'package:invite_application/pages/home/home_page.dart';
import 'package:invite_application/pages/main_page.dart';
import 'package:go_router/go_router.dart';

import 'common_setup/routes.dart';
import 'models/dishes.dart';
import 'pages/home/category/category_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
          //   pageBuilder: (context, state) => DetailPagePopUpRoute(
          //     builder: (context) => DetailPage(),
          //   ),
          // ),
          GoRoute(
            path: Routes.detail,
            pageBuilder: (context, state) => DialogPage(
              builder: (_) => DetailPage(),
            ),
          ),
          GoRoute(
            path: Routes.category,
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: CategoryPage(
                title: 'Азиатская кухня',
                dishes: testDishesData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Dishes testDishesData = Dishes(
  dishes: [
    Dish(
      description:
          'В китайской кухне рис с овощами готовят с добавлением грибов, бамбуковых побегов, моркови, лука и гороха. Эти ингредиенты быстро обжариваются на сковороде с соевым соусом и специями.',
      id: 1,
      imageUrl:
          'https://lh3.googleusercontent.com/fife/APg5EOb3-gGunBAb_3E7L5qZLGIx0Wm8kh4UjNn2yow-7Kvf50D7eFb9Iw5g_7W7TQLGKF29-G6VNa7dHS_zEWY8VaSMh9EqUql8UEFISB_WWgiO8nf_mt0YtUhsWFB5uzw-Bfi_eS9Cs-0vLUMiqaqTGgGFDvVhUvak4AypPMEbt2-3mEkxeZNcClEy29x8gEmUU6e9G8s5GDyCxR404OIsgnGHqtIaGIGD7afRoz7PtgtmZdlXC5v7dHujDNh5l28v249qxjpa1rqxoorBb-ywkRsu1bzqDEHGbRDnFNLXHwEGlHoLS1krz9KcD3opkmQckg7-m7PXzEhnQlayqMPiNGP-WpnFYrthFVfJ0TY4zsYFx1azSJZTLa59Xuqr32eagNn9xF6mCPpGqRbunBKrbD-oWidQ_iAXZRRrgjZrv280Joe8z73AluN0A-mXcqRkpVwQo1n3szZ00wX7sD44PriRwHGUfEenTC5IyLVv3MBsYMNXJ9ALa6FZgTrnUhO_ePGoPftELYGNp4yn-xkzfM_GvnQR8A6od0bR8AqqpNketd0kBavJTkaJXBwsfvxinTdLfOTfWsZAhF97XYNEA_9SmTgnnOjt3N8YUxmUeWcor174r7bNdDuDQqq7vWRgFZNorh5v6LANRk0CVsq6B9tVxP2R1zTCc1yXgpu4kNGJsEvNyxMRy-yM3cBvhu01ZUFSalvwAqcS2M9_eBoPCu00KVtcEvyFPoqm_QNHBEkDLjUdtJC7BGcmv7SPa-rV6oH_3zeIYstyKLrgN-Dzewe816A6J7IN4YxSvCIOWbNV9Q6O3hxua_ZrGSk6ijSoBKE0XHUC04cr1O6BzRxL9lwVUhzvBzYfzmBzMPb84Pq-WwBtfCxN2j34NReGu5iABuA1iDNgz0r8WE2Dvvz0XsD6Uc8neX57A7_19J6vyJEhuARJREXGs4tFWHMmjqg-xwYOOPJhxF1BkCaQrUEKtFYBq1pT2N7_h9fMV8JOLP92grJFHRP6TmNrEjPAf9HjfYRFouBAqFMRy614VrJu5hyweBcy-4WbJNYqrvKZH_bXIQyZ6qlv4omHhGTSMMT9cAYTyiMm12bEH5ccThAygPaXlfx6ydA3towLnMpoq0ieByM2-Nql2uh4xPxgAHcmzipRgEqlYDflDKNSfeTVFKKQ4vtTWa43wR505BTjdO3mk5CVoK4sOzwcF1mQA2joVXdW63wbUWtw4wtfa3e9EP1TV01b5M02KKPcr2yxZpNQCo8-Igp6M8t_vqWSKlkq-Z7NaRswW-xQyuFWjCufwgpd1m8i5Z4tnL72DhelmIiI2cXufJb70_eobyMV5VsMUab1nLKWoKwggolnEjl2A1PLrv6T0aRTYmjt3JqFDEV58aIjZhhyrcX6h6Bb_AJzc-OFvFPw1uAuswJaimihZUfYoVuwtNRI27BD7KGnXzMHKthOM4fArK3ICIt61g91DNHAu9qhpWxsj0FrcmujdWE2vJpBf7XoOcgxiRlRKpljQ2c3M6ULTdS1nuypZleouOtwIHOUoxGtT5HJeC8ZcsgI3przMt97iGmSv5Us7xL0j42wVNZbQnyQ6EsIyIG1ZOo2ah9CyA7RqixQUevdzbPhSnJk2w6weuuRCDkdC4H97doLyAV_=w1366-h617',
      name: 'Рис с овощами',
      price: 799,
      tegs: [
        Teg.ALL,
        Teg.RICE,
        Teg.SALADS,
      ],
      weight: 560,
    ),
  ],
);

class DetailPagePopUpRoute extends Page<void> {
  final WidgetBuilder builder;

  DetailPagePopUpRoute({required this.builder}) : super(key: const ValueKey('DetailPage'));

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
