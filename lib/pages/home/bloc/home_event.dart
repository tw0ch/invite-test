part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class HomeLoadedEvent extends HomeEvent {
  final Categories categories;

  HomeLoadedEvent({
    required this.categories,
  });
}
