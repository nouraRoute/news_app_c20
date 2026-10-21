import 'article.dart';

class ArticleResponceModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  ArticleResponceModel({this.status, this.totalResults, this.articles});

  factory ArticleResponceModel.fromJson(Map<String, dynamic> json) {
    return ArticleResponceModel(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'totalResults': totalResults,
    'articles': articles?.map((e) => e.toJson()).toList(),
  };
}
