import 'package:flutter/material.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/model/network/network_service.dart';

class MainScreenProvider extends ChangeNotifier {
  CategoryEnum? categoryEnum;
  List<Sources>? sources;
  bool isSourcesLoading = false;
  String? sourcesErrorMessage;

  List<Article>? articles;
  bool isArticlesLoading = false;
  String? articlesErrorMessage;
  void changeCategory(CategoryEnum? newCategory) {
    categoryEnum = newCategory;
    notifyListeners();
  }

  Future<void> getSources() async {
    sourcesErrorMessage = null;
    isSourcesLoading = true;

    notifyListeners();
    if (categoryEnum != null) {
      (ErrorModel?, List<Sources>?) response = await NetworkService.getSources(categoryEnum!.name);
      if (response.$1 != null) {
        sourcesErrorMessage = response.$1!.message;
      } else if (response.$2 != null) {
        print('-->${response.$2!.length}');
        sources = response.$2;
      }

      notifyListeners();
    }
    isSourcesLoading = false;
    notifyListeners();
  }

  Future<void> getArticles(String sourceId) async {
    articlesErrorMessage = null;
    isArticlesLoading = true;

    notifyListeners();
    if (categoryEnum != null) {
      (ErrorModel?, List<Article>?) response = await NetworkService.getArticles(sourceId);
      if (response.$1 != null) {
        articlesErrorMessage = response.$1!.message;
      } else if (response.$2 != null) {
        print('-->${response.$2!.length}');
        articles = response.$2;
      }

      notifyListeners();
    }
    isArticlesLoading = false;
    notifyListeners();
  }
}
