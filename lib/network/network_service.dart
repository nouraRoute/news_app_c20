import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/common/app_consts.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/network/endpoints.dart';

class NetworkService {
  static Future<List<Sources>?> getSources(String category) async {
    Dio dio = Dio(
      BaseOptions(baseUrl: AppConsts.baseUrl, queryParameters: {"apiKey": AppConsts.apiKey}),
    );
    print('--category:$category');
    Response response = await dio.get(
      Endpoints.sourcesEndpoint,
      queryParameters: {"category": category},
    );
    if (response.statusCode == 200 &&
        response.data != null &&
        response.data['status'].toString().toLowerCase() == 'ok') {
      print('---SUCCESS---');
      SourceModel sourceModel = SourceModel.fromJson(response.data);
      return sourceModel.sources;
    }
  } //getChannels

  getArticles(String sourceId) {} //getNews
}
