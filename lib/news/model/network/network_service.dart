import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/common/app_consts.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article_respoce_model.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/common/network/endpoints.dart';

class NetworkService {
  static Dio dio = Dio(
    BaseOptions(baseUrl: AppConsts.baseUrl, queryParameters: {"apiKey": AppConsts.apiKey}),
  );
  static Future<(ErrorModel?, List<Sources>?)> getSources(String category) async {
    try {
      Response response = await dio.get(
        Endpoints.sourcesEndpoint,
        queryParameters: {"category": category},
      );
      log(
        'Api:${AppConsts.baseUrl}${Endpoints.sourcesEndpoint}---\nqueryParameters:${{"category": category}}\nMethod:Get',
      );

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data['status'].toString().toLowerCase() == 'ok') {
        log('---SUCCESS---');
        SourceModel sourceModel = SourceModel.fromJson(response.data);
        return (null, sourceModel.sources);
      } else {
        return (RequestError(errorMEssage: response.data?['message']), null);
      }
    } on Exception catch (e) {
      ErrorModel errorModel = ErrorModel.errorHandler(e);
      return (errorModel, null);
    }
  } //getChannels

  static Future<(ErrorModel?, List<Article>?)> getArticles(String sourceId) async {
    try {
      Response response = await dio.get(
        Endpoints.articlesEndpoint,
        queryParameters: {"sources": sourceId},
      );
      log(
        'Api:${AppConsts.baseUrl}${Endpoints.articlesEndpoint}---\nqueryParameters:${{"sources": sourceId}}\nMethod:Get',
      );
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data['status'].toString().toLowerCase() == 'ok') {
        log('---SUCCESS---');
        ArticleResponceModel articleResponceModel = ArticleResponceModel.fromJson(response.data);
        return (null, articleResponceModel.articles);
      } else {
        return (RequestError(errorMEssage: response.data?['message']), null);
      }
    } on Exception catch (e) {
      ErrorModel errorModel = ErrorModel.errorHandler(e);
      return (errorModel, null);
    }
  } //getNews
}
