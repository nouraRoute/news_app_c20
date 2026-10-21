import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/common/widgets/error_widget.dart';
import 'package:news_app/news/model/data_models/source_model.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';
import 'package:news_app/news/view/widgets/articles_body.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayerCubit, MainLayerState>(
      builder: (BuildContext context, state) {
        if (state is GetSourcesLoading) {
          return Center(
            child: CircularProgressIndicator(color: context.theme.colorScheme.secondary),
          );
        } else if (state is GetSourcesError) {
          return Center(
            child: CustomErrorWidget(
              errorMEssage: state.errorMessage,
              onRefresh: () {
                BlocProvider.of<MainLayerCubit>(
                  context,
                  listen: false,
                ).getSources(state.categoryEnum!);
              },
            ),
          );
        } else if (state is ViewSourcesState) {
          List<Sources> sources = state.sources;
          return DefaultTabController(
            length: sources.length,
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
                  tabs: sources.map((e) => Tab(text: e.name ?? '')).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    children: List.generate(
                      sources.length,
                      (index) => ArticlesBody(sourceID: sources[index].id ?? ''),
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
