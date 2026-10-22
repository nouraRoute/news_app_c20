import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/common/widgets/error_widget.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:news_app/news/view/widgets/news_card.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';

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
      BlocProvider.of<MainLayerCubit>(context, listen: false).getArticles(widget.sourceID);
    });
  }

  //get articles ->API
  @override
  Widget build(BuildContext context) {
    MainLayerCubit cubit = context.watch<MainLayerCubit>();
    MainLayerState state = cubit.state;
    if (state is GetArticlesLoading) {
      return Center(child: CircularProgressIndicator(color: context.theme.colorScheme.secondary));
    } else if (state is GetArticlesError) {
      return CustomErrorWidget(
        errorMEssage: state.errorMessage,
        onRefresh: () {
          setState(() {});
        },
      );
    } else if (state is GetArticlesSuccess) {
      List<Article> articles = state.articles;
      return ListView.separated(
        padding: EdgeInsets.all(16.r),
        itemBuilder: (context, index) => NewsCard(article: articles[index]),
        separatorBuilder: (context, index) => SizedBox(height: 24.h),
        itemCount: articles.length,
      );
    }

    return SizedBox();
  }
}
