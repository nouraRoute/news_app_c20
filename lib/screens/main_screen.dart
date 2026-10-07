import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/enums/category_enum.dart';
import 'package:news_app/screens/widgets/category_card_widget.dart';
import 'package:news_app/screens/widgets/drawer_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          "Home", //TODO:localization
        ),
        actions: [Icon(Icons.search)],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: context.textTheme.titleLarge!.copyWith(fontSize: 24.sp),
          ),

          // ...CategoryEnum.values.map((e) => CategoryCardWidget(categoryEnum: e)),
          ...List.generate(
            CategoryEnum.values.length,
            (index) => CategoryCardWidget(
              categoryEnum: CategoryEnum.values[index],
              isEven: index % 2 == 0,
            ),
          ),
        ],
      ),
    );
  }
}
