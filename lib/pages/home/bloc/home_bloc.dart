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
        emit(HomeLoadingState());
        _initHomePage();
      } else if (event is RefreshItemsInDbEvent) {
        _refreshItemsInDb();
      }
    });
    _initHomePage();
  }

  Future<void> _initHomePage() async {
    final savedData = await PersistenceManager.p.getCategoriesFromDb();
    if (savedData != null) {
      add(
        HomeLoadedEvent(
          categories: savedData,
        ),
      );
    } else {
      try {
        Categories? _categories = await CategoriesService().getAllCategories();
        Dishes? _dishes = await DishesService().getAllDishes();
        if (_categories != null && _dishes != null) {
          PersistenceManager.p.saveCategoriesToDb(
            categories: _categories,
          );
          PersistenceManager.p.saveDishesToDb(
            dishes: _dishes,
          );
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

  Future<void> _refreshItemsInDb() async {
    //http
    Categories? _categories = await CategoriesService().getAllCategories();
    Dishes? _dishes = await DishesService().getAllDishes();
    //bd
    Categories? _savedCategoriesData =
        await PersistenceManager.p.getCategoriesFromDb();
    Dishes? _savedDishesData = await PersistenceManager.p.getDishesFromDb();
    if (_categories != null &&
        _dishes != null &&
        _savedCategoriesData != null &&
        _savedDishesData != null) {
      //clear
      await PersistenceManager.p.clearCategoriesCollection();
      await PersistenceManager.p.saveCategoriesToDb(categories: _categories);
      await PersistenceManager.p.clearDishesCollection();
      await PersistenceManager.p.saveDishesToDb(dishes: _dishes);

      add(HomeLoadedEvent(
        categories: _categories,
      ));
    }
  }
}
