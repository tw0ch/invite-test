import 'package:isar/isar.dart';

part 'user_isar.g.dart';

@Collection()
class UserIsar {
  Id id = Isar.autoIncrement;

  @Name('current_address')
  String? currentAddress;
}
