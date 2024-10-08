part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent {}

class BasketLoadedEvent extends BasketEvent {
  final List<BasketItem> basketItems;
  final UserInfo userInfo;

  BasketLoadedEvent({
    required this.basketItems,
    required this.userInfo,
  });
}

class BaksetItemAddQuantityEvent extends BasketEvent {
  final List<BasketItem> items;
  final int itemIndex;

  BaksetItemAddQuantityEvent({
    required this.itemIndex,
    required this.items,
  });
}

class BaksetItemRemoveQuantityEvent extends BasketEvent {
  final int itemIndex;
  final List<BasketItem> items;

  BaksetItemRemoveQuantityEvent({
    required this.itemIndex,
    required this.items,
  });
}