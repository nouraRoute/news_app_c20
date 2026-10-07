import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/theme/app_colors.dart';
import 'package:news_app/common/widgets/custom_drop_down_menu_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      width: 270.w,
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 166.h,
            alignment: Alignment(0, 0),
            color: AppColors.primaryWhiteColor,
            child: Text(
              "News App", //TODO:loclization
              style: AppTextStyles.styleS20W700Black.copyWith(fontSize: 24.sp),
            ),
          ),

          ListTile(
            title: Text("Go To Home", style: AppTextStyles.styleS20W700White),
            leading: Icon(Icons.home_outlined, color: AppColors.primaryWhiteColor),
          ),
          Divider(endIndent: 16.w, indent: 16.w),
          ListTile(
            title: Text("Them", style: AppTextStyles.styleS20W700White),
            leading: Icon(Icons.imagesearch_roller_outlined, color: AppColors.primaryWhiteColor),
          ),

          CustomDropDownMenuWidget(
            forGroundColor: AppColors.primaryWhiteColor,
            bgColor: AppColors.primaryBlackColor,
            items: [
              DropdownMenuEntry(value: ThemeMode.dark, label: 'Dark'),
              DropdownMenuEntry(value: ThemeMode.light, label: 'Light'),
            ],
          ),
          Divider(endIndent: 16.w, indent: 16.w),
          ListTile(
            title: Text("Language", style: AppTextStyles.styleS20W700White),
            leading: Icon(Icons.language, color: AppColors.primaryWhiteColor),
          ),
          CustomDropDownMenuWidget(
            forGroundColor: AppColors.primaryWhiteColor,
            bgColor: AppColors.primaryBlackColor,
            items: [
              DropdownMenuEntry(value: "ar", label: 'Arabic'),
              DropdownMenuEntry(value: 'en', label: 'English'),
            ],
          ),
          Divider(endIndent: 16.w, indent: 16.w),
        ],
      ),
    );
  }
}
