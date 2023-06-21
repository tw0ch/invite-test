import 'package:flutter/material.dart';

import '../database/persistence_manager.dart';
import '../models/сategories.dart';
import 'api_service.dart';

class CategoriesService {
  Future<Categories?> getAllCategories() async {
    final data = await ApiService.getRequest(
      request: '058729bd-1402-4578-88de-265481fd7d54',
    );
    if (data != null) {
      var categories = Categories.fromJson(data);
      return categories;
    } else {
      return null;
    }
  }
}
