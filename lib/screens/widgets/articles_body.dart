import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/common/widgets/error_widget.dart';
import 'package:news_app/models/article_respoce_model/article.dart';
import 'package:news_app/network/network_service.dart';
import 'package:news_app/screens/widgets/news_card.dart';

class ArticlesBody extends StatefulWidget {
  final String sourceID;
  const ArticlesBody({super.key, required this.sourceID});

  @override
  State<ArticlesBody> createState() => _ArticlesBodyState();
}

class _ArticlesBodyState extends State<ArticlesBody> {
  //get articles ->API
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkService.getArticles(widget.sourceID),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: context.theme.colorScheme.secondary),
          );
        }

        (ErrorModel?, List<Article>?) response = asyncSnapshot.data!;
        if (response.$1 != null) {
          return CustomErrorWidget(
            errorMEssage: response.$1!.message,
            onRefresh: () {
              setState(() {});
            },
          );
        }

        List<Article> articles = response.$2 ?? [];
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
