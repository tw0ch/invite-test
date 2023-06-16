abstract class Routes {
  static const String main = '/';
  static const String home = '/home';
  static const String detail = '/home/detail';
  static const String category = '/home/category';
  static const String search = '/search';
  static const String basket = '/basket';
  static const String account = '/account';
}

enum NavigatorRoute {
  home(Routes.home),
  search(Routes.search),
  basket(Routes.basket),
  account(Routes.account);

  final String path;
  const NavigatorRoute(this.path);
}
