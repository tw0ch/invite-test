part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class HomeLoadedEvent extends HomeEvent {
  final Categories categories;
  final Dishes dishes;

  HomeLoadedEvent({
    required this.categories,
    required this.dishes,
  });
}
