part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeLoadingEvent extends HomeEvent {}

class HomeLoadedEvent extends HomeEvent {
  final Categories categories;
  final UserInfo userInfo;

  HomeLoadedEvent({
    required this.categories,
    required this.userInfo,
  });
}

class RefreshItemsInDbEvent extends HomeEvent {}

class HomeLoadingErrorEvent extends HomeEvent {}