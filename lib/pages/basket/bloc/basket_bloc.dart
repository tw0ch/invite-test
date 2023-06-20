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
      }
    });
    _initBasketPage();
  }

  Future<void> _initBasketPage() async {
    final savedData = await PersistenceManager.p.getListBasketItemsFromDb();
    if (savedData != null && savedData.isNotEmpty) {
      add(
        BasketLoadedEvent(
          basketItems: savedData,
        ),
      );
    }
  }
}
