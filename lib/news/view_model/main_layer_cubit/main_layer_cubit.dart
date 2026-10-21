import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/enums/category_enum.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/model/network/network_service.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';

class MainLayerCubit extends Cubit<MainLayerState> {
  MainLayerCubit() : super(MainLAyerInitialState());
  List<Sources>? sources;
  CategoryEnum? selectedCategory;
  Future<void> selectCategory(CategoryEnum? newCategory) async {
    emit(SelectCategoryState(categoryEnum: newCategory));
    if (newCategory != null) {
      await getSources(newCategory);
    }
  }

  Future<void> getSources(CategoryEnum category) async {
    selectedCategory = category;
    emit(GetSourcesLoading(categoryEnum: category));
    (ErrorModel?, List<Sources>?) result = await NetworkService.getSources(category.name);
    if (result.$1 != null) {
      emit(GetSourcesError(categoryEnum: category, errorMessage: result.$1!.message));
    } else {
      sources = result.$2;
      emit(ViewSourcesState(categoryEnum: category, sources: result.$2!));
    }
  }

  Future<void> getArticles(String sourceId) async {
    if (sources == null) return;
    emit(GetArticlesLoading(sources: sources!, categoryEnum: selectedCategory));
    (ErrorModel?, List<Article>?) result = await NetworkService.getArticles(sourceId);
    if (result.$1 != null) {
      emit(
        GetArticlesError(
          categoryEnum: selectedCategory,
          sources: sources!,
          errorMessage: result.$1!.message,
        ),
      );
    } else {
      emit(
        GetArticlesSuccess(
          categoryEnum: selectedCategory,
          sources: sources!,
          articles: result.$2 ?? [],
        ),
      );
    }
  }
}
