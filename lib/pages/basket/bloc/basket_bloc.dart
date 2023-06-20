import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../database/persistence_manager.dart';
import '../../../models/basket_item.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<BasketEvent>((event, emit) {
      if (event is BasketLoadedEvent) {
        emit(
          BasketLoadedState(
            basketItems: event.basketItems,
          ),
        );
      } else if (event is BaksetItemAddQuantityEvent) {
        _addQuantityBasketItem(itemId: event.itemId);
        _initBasketPage();
      } else if (event is BaksetItemRemoveQuantityEvent) {
        _removeQuantityBasketItem(itemId: event.itemId);
         _initBasketPage();
      }
    });
    _initBasketPage();
  }

  Future<void> _initBasketPage() async {
    final savedData = await PersistenceManager.p.getListBasketItemsFromDb();
    if (savedData != null) {
      add(
        BasketLoadedEvent(
          basketItems: savedData,
        ),
      );
    }
  }

  Future<void> _addQuantityBasketItem({required int itemId}) async {
    await PersistenceManager.p.addQuantityBasketItem(
      id: itemId,
    );
  }

  Future<void> _removeQuantityBasketItem({required int itemId}) async {
    await PersistenceManager.p.removeQuantityBasketItem(
      id: itemId,
    );
  }
}
