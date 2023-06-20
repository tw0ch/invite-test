part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class CategoryLoadedEvent extends CategoryEvent {
  final Dishes dishes;
  final List<String> tags;

  CategoryLoadedEvent({
    required this.dishes,
    required this.tags,
  });
}

class AddItemInBasketEvent extends CategoryEvent {
  final int id;
  final String name;
  final int price;
  final int weight;
  final int quantity;
  final String imageUrl;

  AddItemInBasketEvent({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.quantity,
    required this.imageUrl,
  });
}
