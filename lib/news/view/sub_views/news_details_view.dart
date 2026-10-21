import 'package:flutter/material.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/common/widgets/error_widget.dart';
import 'package:news_app/news/view_model/provider/main_screen_provider.dart';
import 'package:news_app/news/view/widgets/articles_body.dart';
import 'package:provider/provider.dart';

class NewsDetailsView extends StatefulWidget {
  const NewsDetailsView({super.key});
  @override
  State<NewsDetailsView> createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainScreenProvider>(context, listen: false).getSources();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (BuildContext context, MainScreenProvider provider, Widget? child) {
        if (provider.isSourcesLoading) {
          return Center(
            child: CircularProgressIndicator(color: context.theme.colorScheme.secondary),
          );
        }
        if (provider.sourcesErrorMessage != null) {
          return Center(
            child: CustomErrorWidget(
              errorMEssage: provider.sourcesErrorMessage!,
              onRefresh: () {
                Provider.of<MainScreenProvider>(context, listen: false).getSources();
              },
            ),
          );
        }
        if ((provider.sources ?? []).isNotEmpty) {
          return DefaultTabController(
            length: provider.sources!.length,
            child: Column(
              children: [
                TabBar(
                  labelStyle: context.textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: context.textTheme.labelSmall,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 0,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,

                  // tabAlignment: TabAlignment.start,
                  tabs: provider.sources!.map((e) => Tab(text: e.name ?? '')).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    children: List.generate(
                      provider.sources!.length,
                      (index) => ArticlesBody(sourceID: provider.sources![index].id ?? ''),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Center(child: Text("No data found!!!"));
      },
    );
  }
}
