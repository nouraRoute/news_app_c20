import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/extensions/context_extensions.dart';
import 'package:news_app/common/extensions/widget_extensions.dart';
import 'package:news_app/enums/category_enum.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({super.key, required this.categoryEnum, required this.isEven});
  final CategoryEnum categoryEnum;
  final bool isEven;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      width: 1.sw,
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(categoryEnum.getImage), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(24.r),
        color: context.theme.colorScheme.secondary,
      ),
      alignment: isEven ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(categoryEnum.name, style: AppTextStyles.styleS20W400Black.copyWith(fontSize: 30.sp)),
          Container(
            width: 170.w,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(84.r),
              color: context.theme.colorScheme.primary.withValues(alpha: .5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                if (!isEven)
                  CircleAvatar(
                    backgroundColor: context.theme.scaffoldBackgroundColor,
                    radius: 27.r,
                    child: Icon(Icons.arrow_back_ios, color: context.theme.colorScheme.secondary),
                  ),

                Text(
                  "View All",
                  style: context.textTheme.titleLarge!.copyWith(fontSize: 24.sp),
                ).symmetricPadding(vertical: 9.h, horizontal: 12.w),

                if (isEven)
                  CircleAvatar(
                    backgroundColor: context.theme.scaffoldBackgroundColor,
                    radius: 27.r,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: context.theme.colorScheme.secondary,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
