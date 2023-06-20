part of 'basket_bloc.dart';

@immutable
abstract class BasketState {}

class BasketInitial extends BasketState {}

class BasketLoadedState extends BasketState {
  final List<BasketItem> basketItems;

  BasketLoadedState({
    required this.basketItems,
  });
}

class BasketLoadingState extends BasketState {}
