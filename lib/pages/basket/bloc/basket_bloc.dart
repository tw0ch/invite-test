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
        _addQuantityBasketItem(
          itemIndex: event.itemIndex,
          items: event.items,
        );
      } else if (event is BaksetItemRemoveQuantityEvent) {
        _removeQuantityBasketItem(
          itemIndex: event.itemIndex,
          items: event.items,
        );
        // _initBasketPage();
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

  Future<void> _addQuantityBasketItem({
    required int itemIndex,
    required List<BasketItem> items,
  }) async {
    await PersistenceManager.p.addQuantityBasketItem(
      id: items[itemIndex].id,
    );
    items[itemIndex].quantity = items[itemIndex].quantity + 1;
    add(
      BasketLoadedEvent(
        basketItems: items,
      ),
    );
  }

  Future<void> _removeQuantityBasketItem({
    required int itemIndex,
    required List<BasketItem> items,
  }) async {
    await PersistenceManager.p.removeQuantityBasketItem(
      id: items[itemIndex].id,
    );

    if (items[itemIndex].quantity > 1) {
      items[itemIndex].quantity = items[itemIndex].quantity - 1;
    } else {
      items.removeAt(itemIndex);
    }
    add(
      BasketLoadedEvent(
        basketItems: items,
      ),
    );
  }
}
