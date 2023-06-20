part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent {}

class BasketLoadedEvent extends BasketEvent {
  final List<BasketItem> basketItems;

  BasketLoadedEvent({
    required this.basketItems,
  });
}

class BaksetItemAddQuantityEvent extends BasketEvent {}

class BaksetItemRemoveQuantityEvent extends BasketEvent {}