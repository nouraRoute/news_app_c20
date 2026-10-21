import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/common/widgets/error_widget.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:news_app/news/view/widgets/news_card.dart';
import 'package:news_app/news/view_model/provider/main_screen_provider.dart';
import 'package:provider/provider.dart';

class ArticlesBody extends StatefulWidget {
  final String sourceID;
  const ArticlesBody({super.key, required this.sourceID});

  @override
  State<ArticlesBody> createState() => _ArticlesBodyState();
}

class _ArticlesBodyState extends State<ArticlesBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainScreenProvider>(context, listen: false).getArticles(widget.sourceID);
    });
  }

  //get articles ->API
  @override
  Widget build(BuildContext context) {
    MainScreenProvider provider = context.watch<MainScreenProvider>();

    if (provider.isArticlesLoading) {
      return Center(child: CircularProgressIndicator(color: context.theme.colorScheme.secondary));
    }

    if (provider.articlesErrorMessage != null) {
      return CustomErrorWidget(
        errorMEssage: provider.articlesErrorMessage!,
        onRefresh: () {
          setState(() {});
        },
      );
    }

    List<Article> articles = provider.articles ?? [];
    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      itemBuilder: (context, index) => NewsCard(article: articles[index]),
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
      itemCount: articles.length,
    );
  }
}
