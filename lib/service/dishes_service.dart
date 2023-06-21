import '../database/persistence_manager.dart';
import '../models/dishes.dart';
import '../models/сategories.dart';
import 'api_service.dart';

class DishesService {
  Future<Dishes?> getAllDishes() async {
    final data = await ApiService.getRequest(
      request: 'aba7ecaa-0a70-453b-b62d-0e326c859b3b',
    );
    if (data != null) {
      var dishes = Dishes.fromJson(data);
      return dishes;
    } else {
      return null;
    }
  }
}
