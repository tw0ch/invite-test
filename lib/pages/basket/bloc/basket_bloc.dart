import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../database/persistence_manager.dart';
import '../../../models/basket_item.dart';
import '../../../models/user.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<BasketEvent>((event, emit) {
      if (event is BasketLoadedEvent) {
        emit(
          BasketLoadedState(
            basketItems: event.basketItems,
            userInfo: event.userInfo,
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
      } 
      //else if (event is BasketEmptyEvent) {
      //   emit(BasketEmptyState(
      //     userInfo: event.userInfo,
      //   ));
      // }
    });
    _initBasketPage();
  }

  Future<void> _initBasketPage() async {
    final savedData = await PersistenceManager.p.getListBasketItemsFromDb();
    final savedUserData = await PersistenceManager.p.getUserInfoFromDb();
    if (savedData != null && savedUserData != null) {
      add(
        BasketLoadedEvent(
          basketItems: savedData,
          userInfo: UserInfo(
            currentAddress: savedUserData.currentAddress,
            id: 0,
          ),
        ),
      );
    } else if (savedData == null && savedUserData != null) {
      add(
        BasketLoadedEvent(
          basketItems: [],
          userInfo: UserInfo(
            currentAddress: savedUserData.currentAddress,
            id: 0,
          ),
        ),
      );
      // add(
      //   BasketEmptyEvent(
      //     userInfo: UserInfo(
      //       currentAddress: savedUserData.currentAddress,
      //       id: 0,
      //     ),
      //   ),
      // );
    }
  }

  Future<void> _addQuantityBasketItem({
    required int itemIndex,
    required List<BasketItem> items,
  }) async {
    await PersistenceManager.p.addQuantityBasketItem(
      id: items[itemIndex].id,
    );
    final savedUserData = await PersistenceManager.p.getUserInfoFromDb();

    items[itemIndex].quantity = items[itemIndex].quantity + 1;
    add(
      BasketLoadedEvent(
        basketItems: items,
        userInfo: UserInfo(
          currentAddress: savedUserData?.currentAddress ?? 'Санкт-Петербург',
          id: 0,
        ),
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
    final savedUserData = await PersistenceManager.p.getUserInfoFromDb();

    if (items[itemIndex].quantity > 1) {
      items[itemIndex].quantity = items[itemIndex].quantity - 1;
    } else {
      items.removeAt(itemIndex);
    }
    add(
      BasketLoadedEvent(
        basketItems: items,
        userInfo: UserInfo(
          currentAddress: savedUserData?.currentAddress ?? 'Санкт-Петербург',
          id: 0,
        ),
      ),
    );
  }
}
