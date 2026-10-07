import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_text_styles.dart';

class CustomDropDownMenuWidget extends StatelessWidget {
  const CustomDropDownMenuWidget({
    super.key,
    required this.forGroundColor,
    required this.bgColor,
    required this.items,
  });
  final Color forGroundColor;
  final Color bgColor;
  final List<DropdownMenuEntry> items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
      child: DropdownMenu(
        width: 237,
        trailingIcon: Icon(Icons.arrow_drop_down_rounded, color: forGroundColor),
        textStyle: AppTextStyles.styleS20W500White,

        dropdownMenuEntries: items
            .map(
              (e) => DropdownMenuEntry(
                value: e.value,
                label: e.label,
                style: ButtonStyle(foregroundColor: WidgetStateProperty.all(forGroundColor)),
              ),
            )
            .toList(),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: forGroundColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: forGroundColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: forGroundColor),
          ),
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(bgColor),
          elevation: WidgetStateProperty.all(8),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ),
    );
  }
}
