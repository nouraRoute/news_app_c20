import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';
import 'package:news_app/news/view/sub_views/home_view.dart';
import 'package:news_app/news/view/sub_views/news_details_view.dart';
import 'package:news_app/news/view/widgets/drawer_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainLayerCubit(),
      child: BlocBuilder<MainLayerCubit, MainLayerState>(
        builder: (context, state) {
          return Scaffold(
            drawer: DrawerWidget(),
            appBar: AppBar(
              title: Text(
                "Home", //TODO:localization
              ),
              actions: [Icon(Icons.search)],
            ),
            body: state.categoryEnum == null ? HomeView() : NewsDetailsView(), //HomeView()
          );
        },
      ),
    );
  }
}
