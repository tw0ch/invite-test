import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../database/persistence_manager.dart';
import '../../../models/dishes.dart';
import '../../../models/сategories.dart';
import '../../../service/categories_service.dart';
import '../../../service/dishes_service.dart';
import 'package:flutter/foundation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) {
      if (event is HomeLoadedEvent) {
        emit(HomeLoadedState(
          categories: event.categories,
        ));
      } else if (event is HomeLoadingEvent) {
        _initHomePage();
        emit(HomeLoadingState());
      }
    });
    _initHomePage();
  }

  Future<void> _initHomePage() async {
    // await Future.delayed(Duration(seconds: 5), () {});
    final savedData = await PersistenceManager.p.getCategoriesFromDb();

    try {} catch (e) {}

    if (savedData != null) {
      final Categories? _categories =
          await CategoriesService().getAllCategories();
      if (_categories != null &&
          listEquals(
            savedData.categories,
            _categories.categories,
          )) {
        add(
          HomeLoadedEvent(
            categories: savedData,
          ),
        );
      }
    } else {
      try {
        Categories? _categories = await CategoriesService().getAllCategories();
        Dishes? _dishes = await DishesService().getAllDishes();
        _persistanceManager.saveCategoriesToDb(categories: categories);
        if (_categories != null && _dishes != null) {
          add(
            HomeLoadedEvent(
              categories: _categories,
            ),
          );
        }
      } catch (e) {
        debugPrint('Error - get categories');
      }
    }
  }
}
