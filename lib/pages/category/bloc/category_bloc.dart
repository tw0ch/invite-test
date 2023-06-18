import 'package:bloc/bloc.dart';
import 'package:invite_application/database/persistence_manager.dart';
import 'package:meta/meta.dart';

import '../../../models/dishes.dart';
import '../../../service/dishes_service.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) {
      if (event is CategoryLoadedEvent) {
        emit(CategoryLoadedState(
          dishes: event.dishes,
          tags: event.tags,
        ));
      } else if (event is AddItemInBasketEvent) {
        _addItemInBasket(
          name: event.name,
          price: event.price,
          weight: event.weight,
          quantity: event.quantity,
          imageUrl: event.imageUrl,
        );
      }
    });
    _initCategoryPage();
  }

  Future<void> _initCategoryPage() async {
    final savedData = await PersistenceManager.p.getDishesFromDb();
    List<String> _tags = Dishes.allTags.toList();

    if (savedData != null && _tags.isNotEmpty) {
      add(
        CategoryLoadedEvent(
          dishes: savedData,
          tags: _tags,
        ),
      );
    } else {
      try {
        Dishes? _dishes = await DishesService().getAllDishes();
        _tags = Dishes.allTags.toList();
        if (_dishes != null) {
          add(
            CategoryLoadedEvent(
              dishes: _dishes,
              tags: _tags,
            ),
          );
        }
      } catch (e) {
        print('Error - get categories');
      }
    }
  }

  Future<void> _addItemInBasket({
    required String name,
    required int price,
    required int weight,
    required int quantity,
    required String imageUrl,
  }) async {
    await PersistenceManager.p.saveBasketItemToDb(
      name: name,
      price: price,
      weight: weight,
      quantity: quantity,
      imageUrl: imageUrl,
    );
    print('save item - ${name} in basketDB success.');
  }
}
