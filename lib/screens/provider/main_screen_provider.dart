import 'package:flutter/material.dart';
import 'package:news_app/enums/category_enum.dart';

class MainScreenProvider extends ChangeNotifier {
  CategoryEnum? categoryEnum;
  void changeCategory(CategoryEnum? newCategory) {
    categoryEnum = newCategory;
    notifyListeners();
  }
}
