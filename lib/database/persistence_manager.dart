import 'package:invite_application/models/%D1%81ategories.dart';
import 'package:invite_application/pages/basket/basket_page.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/basket_item.dart';
import '../models/basket_item_isar.dart';
import '../models/categories_isar.dart';
import '../models/dishes.dart';
import '../models/dishes_isar.dart';

class PersistenceManager {
  static final p = PersistenceManager();

  Isar? _isar;

  Future<Isar> get _isarGetter async {
    final appDir = await getApplicationDocumentsDirectory();
    if (_isar != null) {
      return _isar!;
    } else {
      _isar ??= await Isar.open(
        [
          CategoriesIsarSchema,
          DishesIsarSchema,
        ],
        directory: appDir.path,
      );
      return _isar!;
    }
  }

  Future<void> saveCategoriesToDb({required Categories categories}) async {
    final isar = await _isarGetter;
    for (int i = 0; i < categories.categories.length; i++) {
      final isarCategory = CategoriesIsar()
        ..name = categories.categories[i].name.toString()
        ..imageUrl = categories.categories[i].imageUrl.toString();
      isar.writeTxn(() async {
        isar.categoriesIsars.put(isarCategory);
      });
    }
  }

  Future<Categories?> getCategoriesFromDb() async {
    final isar = await _isarGetter;
    final items = await isar.categoriesIsars.where().findAll();
    print('items length - ${items.length}');
    Categories categories;
    List<Category> categoryList = [];
    for (int i = 0; i < items.length; i++) {
      categoryList.add(
        Category(
          id: items[i].id,
          imageUrl: items[i].imageUrl.toString(),
          name: items[i].name.toString(),
        ),
      );
    }
    if (categoryList.isNotEmpty) {
      categories = Categories(categories: categoryList);
      return categories;
    } else {
      return null;
    }
  }

  Future<void> saveDishesToDb({required Dishes dishes}) async {
    final isar = await _isarGetter;
    for (int i = 0; i < dishes.dishes.length; i++) {
      final isarDish = DishesIsar()
        ..name = dishes.dishes[i].name.toString()
        ..price = dishes.dishes[i].price.toInt()
        ..weight = dishes.dishes[i].weight.toInt()
        ..description = dishes.dishes[i].description.toString()
        ..imageUrl = dishes.dishes[i].imageUrl.toString()
        ..tags = List<String>.from(dishes.dishes[i].tags.map((x) => x));
      isar.writeTxn(() async {
        isar.dishesIsars.put(isarDish);
      });
    }
  }

  Future<Dishes?> getDishesFromDb() async {
    final isar = await _isarGetter;
    final items = await isar.dishesIsars.where().findAll();

    Dishes dishes;
    List<Dish> dishList = [];

    for (int i = 0; i < items.length; i++) {
      final List<String> tags = items[i].tags ?? [];
      dishList.add(
        Dish(
          id: items[i].id,
          name: items[i].name.toString(),
          price: items[i].price ?? 0,
          weight: items[i].weight ?? 0,
          description: items[i].description ?? '',
          imageUrl: items[i].imageUrl ?? '',
          tags: List<String>.from(
            tags.map((x) => x),
          ),
        ),
      );
    }
    if (dishList.isNotEmpty) {
      dishes = Dishes(dishes: dishList);
      return dishes;
    } else {
      return null;
    }
  }

  Future<void> saveBasketItemToDb({
    required String name,
    required int price,
    required int weight,
    required int quantity,
    required String imageUrl,
  }) async {
    final isar = await _isarGetter;
    final isarBasketItem = BasketItemIsar()
      ..name = name
      ..price = price
      ..weight = weight
      ..quantity = quantity
      ..imageUrl = imageUrl;
    isar.writeTxn(() async {
      isar.basketItemIsars.put(isarBasketItem);
    });
  }

  Future<List<BasketItem>?> getListBasketItemsFromDb() async {
    final isar = await _isarGetter;
    final items = await isar.basketItemIsars.where().findAll();

    List<BasketItem> basketItemsList = [];
    for (int i = 0; i < items.length; i++) {
      basketItemsList.add(
        BasketItem(
          id: items[i].id,
          name: items[i].name ?? '',
          price: items[i].price ?? 0,
          quantity: items[i].quantity ?? 0,
          weight: items[i].weight ?? 0,
          imageUrl: items[i].imageUrl ?? '',
        ),
      );
    }
    if (basketItemsList.isNotEmpty) {
      return basketItemsList;
    } else {
      return null;
    }
  }
}
