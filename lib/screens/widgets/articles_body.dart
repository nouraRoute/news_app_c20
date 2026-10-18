import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/models/article_respoce_model/article.dart';
import 'package:news_app/network/network_service.dart';
import 'package:news_app/screens/widgets/news_card.dart';

class ArticlesBody extends StatelessWidget {
  final String sourceID;
  const ArticlesBody({super.key, required this.sourceID});
  //get articles ->API
  //update view based on state
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkService.getArticles(sourceID),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: context.theme.colorScheme.secondary),
          );
        } else if (asyncSnapshot.hasError) {
          return Center(child: Text(asyncSnapshot.error.toString()));
        }

        List<Article> articles = asyncSnapshot.data ?? [];
        return ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemBuilder: (context, index) => NewsCard(article: articles[index]),
          separatorBuilder: (context, index) => SizedBox(height: 24.h),
          itemCount: articles.length,
        );
      },
    );
  }
}
