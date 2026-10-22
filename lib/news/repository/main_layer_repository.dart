import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/model/data_source/main_layer_data_source.dart';

class MainLayerRepository {
  final MainLayerDataSource _dataSource;

  MainLayerRepository({required MainLayerDataSource dataSource}) : _dataSource = dataSource;
  Future<(ErrorModel?, List<Sources>?)> getSources(String categoryId) async {
    return await _dataSource.getSources(categoryId);
  }

  Future<(ErrorModel?, List<Article>?)> getArticles(String sourceId) async {
    return await _dataSource.getArticles(sourceId);
  }
}
