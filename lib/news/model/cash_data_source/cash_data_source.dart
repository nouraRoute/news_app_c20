import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/model/data_source/main_layer_data_source.dart';

class CashDataSource extends MainLayerDataSource {
  @override
  Future<(ErrorModel?, List<Article>?)> getArticles(String sourceId) async {
    // TODO: implement getArticles
    return (GeneralError(), null);
  }

  @override
  Future<(ErrorModel?, List<Sources>?)> getSources(String sourceId) async {
    // TODO: implement getArticles
    return (GeneralError(), null);
  }
}
