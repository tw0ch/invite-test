import 'package:invite_application/models/%D1%81ategories.dart';
import 'package:invite_application/pages/basket/basket_page.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/basket_item.dart';
import '../models/basket_item_isar.dart';
import '../models/categories_isar.dart';
import '../models/dishes.dart';
import '../models/dishes_isar.dart';
import '../models/user.dart';
import '../models/user_isar.dart';

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
          BasketItemIsarSchema,
          UserIsarSchema,
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

  Future<void> clearCategoriesCollection() async {
    final isar = await _isarGetter;
    final collection = isar.categoriesIsars;
    isar.writeTxn(() async {
      await collection.clear();
    });
  }

  Future<void> clearDishesCollection() async {
    final isar = await _isarGetter;
    final collection = isar.dishesIsars;
    isar.writeTxn(() async {
      await collection.clear();
    });
  }

  Future<Dishes?> getFilteredDishesFromDb({
    required List<int> activeTagsIndexes,
    required List<String> tags,
  }) async {
    final isar = await _isarGetter;
    final List<String> activeTags = List.generate(
      activeTagsIndexes.length,
      (index) => tags[activeTagsIndexes[index]],
    );
    final List<DishesIsar> items;

    if ((activeTagsIndexes.contains(0) && activeTagsIndexes.length == 1) ||
        activeTags.isEmpty) {
      items = await isar.dishesIsars.where().findAll();
    } else {
      items = await isar.dishesIsars
          .filter()
          .allOf(
            activeTags,
            (q, element) => q.tagsElementEqualTo(element),
          )
          .findAll();
    }
    print('filtered dishesIsars length - ${items.length}');
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

    dishes = Dishes(dishes: dishList);
    return dishes;
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
    required int id,
    required String name,
    required int price,
    required int weight,
    required int quantity,
    required String imageUrl,
  }) async {
    final isar = await _isarGetter;
    final element = await isar.basketItemIsars.get(id);
    if (element != null) {
      isar.writeTxn(() async {
        if (element.quantity != null) {
          element.quantity = element.quantity! + 1;
        } else {
          element.quantity = 1;
        }
        isar.basketItemIsars.put(element);
      });
    } else {
      final isarBasketItem = BasketItemIsar()
        ..id = id
        ..name = name
        ..price = price
        ..weight = weight
        ..quantity = quantity
        ..imageUrl = imageUrl;
      isar.writeTxn(() async {
        isar.basketItemIsars.put(isarBasketItem);
      });
    }
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

  Future<void> addQuantityBasketItem({required int id}) async {
    final isar = await _isarGetter;
    final element = await isar.basketItemIsars.get(id);
    if (element != null) {
      isar.writeTxn(() async {
        element.quantity = element.quantity! + 1;
        isar.basketItemIsars.put(element);
      });
    }
  }

  Future<void> removeQuantityBasketItem({required int id}) async {
    final isar = await _isarGetter;
    final element = await isar.basketItemIsars.get(id);
    if (element != null) {
      if (element.quantity! > 1) {
        isar.writeTxn(() async {
          element.quantity = element.quantity! - 1;
          isar.basketItemIsars.put(element);
        });
      } else {
        isar.writeTxn(() async {
          isar.basketItemIsars.delete(element.id);
        });
      }
    }
  }

  Future<void> saveUserInfoToDb({required String currentAddress}) async {
    final isar = await _isarGetter;
    final isarUser = UserIsar()..currentAddress = currentAddress;
    isar.writeTxn(() async {
      isar.userIsars.put(isarUser);
    });
  }

  Future<UserInfo?> getUserInfoFromDb() async {
    final isar = await _isarGetter;
    final List<UserIsar>? item = await isar.userIsars.where().findAll();
    if (item != null && item.isNotEmpty) {
      var userInfo = UserInfo(
      currentAddress: item.first.currentAddress ?? 'unknow',
      id: item.first.id,
    );
    return userInfo;
    } else {
      return null;
    }
    
  }

   Future<void> clearUserInfoCollection() async {
    final isar = await _isarGetter;
    final collection = isar.userIsars;
    isar.writeTxn(() async {
      await collection.clear();
    });
  }
}
