import 'package:isar/isar.dart';

part 'dishes_isar.g.dart';

@Collection()
class DishesIsar {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? name;

  int? price;

  int? weight;

  String? description;

  @Name('image_url')
  String? imageUrl;
  
  List<String>? tegs;
}
