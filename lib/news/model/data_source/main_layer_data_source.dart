import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:news_app/news/model/data_models/source_model.dart';

abstract class MainLayerDataSource {
  Future<(ErrorModel?, List<Sources>?)> getSources(String sourceId);
  Future<(ErrorModel?, List<Article>?)> getArticles(String sourceId);
}
