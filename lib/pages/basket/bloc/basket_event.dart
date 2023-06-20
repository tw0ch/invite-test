part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent {}



class BasketLoadedEvent extends BasketEvent {
  final List<BasketItem> basketItems;

  BasketLoadedEvent({
    required this.basketItems,
  });
}

class BaksetItemAddQuantityEvent extends BasketEvent {
  final int itemId;

  BaksetItemAddQuantityEvent({
    required this.itemId,
  });
}

class BaksetItemRemoveQuantityEvent extends BasketEvent {
    final int itemId;

  BaksetItemRemoveQuantityEvent({
    required this.itemId,
  });
}
