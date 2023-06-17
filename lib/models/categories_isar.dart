import 'package:isar/isar.dart';

part 'categories_isar.g.dart';

@Collection()
class CategoriesIsar {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  
  String? name;

  @Name('image_url')
  String? imageUrl;
}
