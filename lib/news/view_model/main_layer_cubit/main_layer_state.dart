import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:news_app/news/model/data_models/source_model.dart';

abstract class MainLayerState {
  CategoryEnum? categoryEnum;
  MainLayerState({required this.categoryEnum});
}

class MainLAyerInitialState extends MainLayerState {
  MainLAyerInitialState() : super(categoryEnum: null);
}

class SelectCategoryState extends MainLayerState {
  SelectCategoryState({required super.categoryEnum});
}

class GetSourcesLoading extends MainLayerState {
  GetSourcesLoading({required super.categoryEnum});
}

class GetSourcesError extends MainLayerState {
  final String errorMessage;
  GetSourcesError({required super.categoryEnum, required this.errorMessage});
}

class ViewSourcesState extends MainLayerState {
  final List<Sources> sources;
  ViewSourcesState({required super.categoryEnum, required this.sources});
}

class GetArticlesLoading extends ViewSourcesState {
  GetArticlesLoading({required super.categoryEnum, required super.sources});
}

class GetArticlesSuccess extends ViewSourcesState {
  final List<Article> articles;
  GetArticlesSuccess({required super.categoryEnum, required super.sources, required this.articles});
}

class GetArticlesError extends ViewSourcesState {
  final String errorMessage;
  GetArticlesError({
    required super.categoryEnum,
    required super.sources,
    required this.errorMessage,
  });
}
