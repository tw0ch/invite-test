part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final Dishes dishes;
  final List<String> tags;

  CategoryLoadedState({
    required this.dishes,
    required this.tags,
  });
}
