import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common_setup/routes.dart';
import '../utils/app_colors.dart';
import '../utils/app_icons_icons.dart';

class MainPage extends StatefulWidget {
  final String location;
  final Widget child;

  const MainPage({
    super.key,
    required this.location,
    required this.child,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int get _currentIndex => NavigatorRoute.values
      .firstWhere((e) => widget.location.contains(e.path))
      .index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  void _onItemTaped(BuildContext context, NavigatorRoute navigatorRoute) {
    if (navigatorRoute.index != _currentIndex) {
      context.go(navigatorRoute.path);
    }
  }

  Widget _bottomNavigationBar() {
    return SafeArea(
      child: SizedBox(
        height: 68.6,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(AppIcons.home),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.search),
                label: 'Поиск',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.basket),
                label: 'Корзина',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.account),
                label: 'Аккаунт',
              ),
            ],
            onTap: (index) => _onItemTaped(
              context,
              NavigatorRoute.values[index],
            ),
            currentIndex: _currentIndex,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.color3364E0,
            unselectedItemColor: AppColors.colorA5A9B2,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
            ),
            iconSize: 24,
          ),
        ),
      ),
    );
  }
}
