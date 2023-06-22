part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final Categories categories;
  final UserInfo userInfo;

  HomeLoadedState({
    required this.categories,
    required this.userInfo,
  });
}

class HomeLoadingErrorState extends HomeState {}