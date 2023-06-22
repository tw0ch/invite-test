import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../database/persistence_manager.dart';
import '../../../models/dishes.dart';
import '../../../models/user.dart';
import '../../../models/сategories.dart';
import '../../../service/categories_service.dart';
import '../../../service/dishes_service.dart';
import 'package:flutter/foundation.dart';

import '../../../service/geolocation_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) {
      if (event is HomeLoadedEvent) {
        emit(HomeLoadedState(
          categories: event.categories,
          userInfo: event.userInfo,
        ));
      } else if (event is HomeLoadingEvent) {
        emit(HomeLoadingState());
        _initHomePage();
      } else if (event is RefreshItemsInDbEvent) {
        _refreshItemsInDb();
      } else if (event is HomeLoadingErrorEvent) {
        emit(HomeLoadingErrorState());
      }
    });
    _initHomePage();
  }

  Future<void> _initHomePage() async {
    final savedData = await PersistenceManager.p.getCategoriesFromDb();
    final savedUserData = await PersistenceManager.p.getUserInfoFromDb();
    if (savedData != null && savedUserData != null) {
      add(
        HomeLoadedEvent(
          categories: savedData,
          userInfo: savedUserData,
        ),
      );
    } else {
      try {
        String? _currentAddress =
            await GeolocationService.g.getCurrentPosition();
        Categories? _categories = await CategoriesService().getAllCategories();
        Dishes? _dishes = await DishesService().getAllDishes();
        if (_categories != null && _dishes != null) {
          PersistenceManager.p.saveCategoriesToDb(
            categories: _categories,
          );
          PersistenceManager.p.saveDishesToDb(
            dishes: _dishes,
          );
          PersistenceManager.p.saveUserInfoToDb(
            currentAddress: _currentAddress ?? 'Санкт-Петербург',
          );
          add(
            HomeLoadedEvent(
              categories: _categories,
              userInfo: UserInfo(
                currentAddress: _currentAddress ?? 'Санкт-Петербург',
                id: 0,
              ),
            ),
          );
        } else {
          add(HomeLoadingErrorEvent());
        }
      } catch (e) {
        debugPrint('Error - get categories');
      }
    }
  }

  Future<void> _refreshItemsInDb() async {
    add(HomeLoadingEvent());
    //http
    Categories? _categories = await CategoriesService().getAllCategories();
    Dishes? _dishes = await DishesService().getAllDishes();
    String? _currentAddress = await GeolocationService.g.getCurrentPosition();
    //bd
    Categories? _savedCategoriesData =
        await PersistenceManager.p.getCategoriesFromDb();
    Dishes? _savedDishesData = await PersistenceManager.p.getDishesFromDb();
    if (_categories != null &&
        _dishes != null &&
        _savedCategoriesData != null &&
        _savedDishesData != null) {
      //clear dv
      await PersistenceManager.p.clearCategoriesCollection();
      await PersistenceManager.p.clearDishesCollection();
      await PersistenceManager.p.clearUserInfoCollection();
      //add to db
      await PersistenceManager.p.saveCategoriesToDb(categories: _categories);
      await PersistenceManager.p.saveDishesToDb(dishes: _dishes);
      await PersistenceManager.p.saveUserInfoToDb(
        currentAddress: _currentAddress ?? 'Санкт-Петербург',
      );
      add(
        HomeLoadedEvent(
          categories: _categories,
          userInfo: UserInfo(
            currentAddress: _currentAddress ?? 'Санкт-Петербург',
            id: 0,
          ),
        ),
      );
    } else if (_categories != null &&
        _dishes != null &&
        (_savedCategoriesData == null || _savedDishesData == null)) {
      await PersistenceManager.p.saveCategoriesToDb(categories: _categories);
      await PersistenceManager.p.saveDishesToDb(dishes: _dishes);
      await PersistenceManager.p.saveUserInfoToDb(
        currentAddress: _currentAddress ?? 'Санкт-Петербург',
      );
      add(
        HomeLoadedEvent(
          categories: _categories,
          userInfo: UserInfo(
            currentAddress: _currentAddress ?? 'Санкт-Петербург',
            id: 0,
          ),
        ),
      );
    }
  }
}
