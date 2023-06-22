part of 'basket_bloc.dart';

@immutable
abstract class BasketState {}

class BasketInitial extends BasketState {}

class BasketLoadedState extends BasketState {
  final List<BasketItem> basketItems;
  final UserInfo userInfo;

  BasketLoadedState({
    required this.basketItems,
    required this.userInfo,
  });
}

class BasketEmptyState extends BasketState {
  final UserInfo userInfo;
  BasketEmptyState({
    required this.userInfo,
  });
}
