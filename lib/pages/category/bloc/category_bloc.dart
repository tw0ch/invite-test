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
        emit(
          CategoryLoadedState(
            dishes: event.dishes,
            tags: event.tags,
            activeTagsIndexes: event.activeTagsIndexes,
          ),
        );
      } else if (event is AddItemInBasketEvent) {
        _addItemInBasket(
          id: event.id,
          name: event.name,
          price: event.price,
          weight: event.weight,
          quantity: event.quantity,
          imageUrl: event.imageUrl,
        );
      } else if (event is FilterItemsByTagEvent) {
        _filterItemsByTagEvent(
          tags: event.tags,
          activeTagsIndexes: event.activeTagsIndexes,
        );
      }
    });
    _initCategoryPage();
  }

  Future<void> _filterItemsByTagEvent({
    required List<int> activeTagsIndexes,
    required List<String> tags,
  }) async {
    final filteredData = await PersistenceManager.p.getFilteredDishesFromDb(
      activeTagsIndexes: activeTagsIndexes,
      tags: tags,
    );
    if (filteredData != null) {
      add(
        CategoryLoadedEvent(
          dishes: filteredData,
          tags: tags,
          activeTagsIndexes: activeTagsIndexes,
        ),
      );
    }
  }

  Future<void> _initCategoryPage() async {
    final savedData = await PersistenceManager.p.getDishesFromDb();
    if (savedData != null) {
      List<String> _tags = _catchTags(savedData);
      add(
        CategoryLoadedEvent(
          dishes: savedData,
          tags: _tags,
          activeTagsIndexes: [0],
        ),
      );
    } else {
      try {
        Dishes? _dishes = await DishesService().getAllDishes();
        if (_dishes != null) {
          List<String> _tags = _catchTags(_dishes);
          add(
            CategoryLoadedEvent(
              dishes: _dishes,
              tags: _tags,
              activeTagsIndexes: [0],
            ),
          );
        }
      } catch (e) {
        print('Error - get categories');
      }
    }
  }

  List<String> _catchTags(Dishes savedData) {
    Set<String> allTagsSet = {};
    for (int i = 0; i < savedData.dishes.length; i++) {
      for (var element in savedData.dishes[i].tags) {
        allTagsSet.add(element);
      }
    }
    List<String> allTagsList = allTagsSet.toList();
    return allTagsList;
  }

  Future<void> _addItemInBasket({
    required int id,
    required String name,
    required int price,
    required int weight,
    required int quantity,
    required String imageUrl,
  }) async {
    await PersistenceManager.p.saveBasketItemToDb(
      id: id,
      name: name,
      price: price,
      weight: weight,
      quantity: quantity,
      imageUrl: imageUrl,
    );
    print('save item - ${name} in basketDB success.');
  }
}
