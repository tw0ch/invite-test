import 'package:isar/isar.dart';

part 'basket_item_isar.g.dart';

@Collection()
class BasketItemIsar {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? name;
  int? price;
  int? weight;
  int? quantity;

  @Name('image_url')
  String? imageUrl;
}
