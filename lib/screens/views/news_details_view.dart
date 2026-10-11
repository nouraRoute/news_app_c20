import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/widgets/news_card.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelStyle: context.textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
            unselectedLabelStyle: context.textTheme.labelSmall,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerHeight: 0,
            isScrollable: false,

            // tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: "xx1"),
              Tab(text: "xx2"),
              Tab(text: "xx3"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildTabBarView([]),
                _buildTabBarView([
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                ]),
                _buildTabBarView([
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                  NewsModel(
                    author: "author",
                    id: 'id',
                    image:
                        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
                    publishedAt: 'publishedAt',
                    title: 'title',
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTabBarView(List<NewsModel> newsList) {
    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      itemBuilder: (context, index) => NewsCard(newsModel: newsList[index]),
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
      itemCount: newsList.length,
    );
  }
}
