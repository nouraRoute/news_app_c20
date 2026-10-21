// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/common/theme/app_colors.dart';
import 'package:news_app/news/model/data_models/article_respoce_model/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.colorScheme.secondary),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          SizedBox(
            width: 1.sw,
            height: 220.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                article.urlToImage ?? '',
                width: 1.sw,
                height: 220.h,
                fit: BoxFit.cover,

                // progressIndicatorBuilder: (context, child, loadingProgress) => Center(
                //   child: CircularProgressIndicator(color: context.theme.colorScheme.secondary),
                // ),
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: context.theme.colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
          Text(
            article.title ?? '',
            style: context.textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (article.author != null)
                Expanded(
                  child: Text(
                    'by:${article.author}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              if (article.publishedAtDate != null)
                Text(
                  timeago.format(article.publishedAtDate!),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.greyColor,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
