import 'package:flutter/material.dart';
import 'package:news_app/common/app_text_styles.dart';
import 'package:news_app/common/theme/app_colors.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryWhiteColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryWhiteColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryWhiteColor,
      foregroundColor: AppColors.primaryBlackColor,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.styleS22W700Black,
      displayMedium: AppTextStyles.styleS20W700Black,
      displaySmall: AppTextStyles.styleS18W700Black,

      headlineLarge: AppTextStyles.styleS22W600Black,
      headlineMedium: AppTextStyles.styleS20W600Black,
      headlineSmall: AppTextStyles.styleS18W600Black,

      titleLarge: AppTextStyles.styleS22W500Black,
      titleMedium: AppTextStyles.styleS20W500Black,
      titleSmall: AppTextStyles.styleS18W500Black,

      bodyLarge: AppTextStyles.styleS22W400Black,
      bodyMedium: AppTextStyles.styleS20W400Black,
      bodySmall: AppTextStyles.styleS18W400Black,

      labelLarge: AppTextStyles.styleS18W400Black,
      labelMedium: AppTextStyles.styleS16W400Black,
      labelSmall: AppTextStyles.styleS14W400Black,
    ),
  );
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBlackColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlackColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryBlackColor,
      foregroundColor: AppColors.primaryWhiteColor,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.styleS22W700White,
      displayMedium: AppTextStyles.styleS20W700White,
      displaySmall: AppTextStyles.styleS18W700White,

      headlineLarge: AppTextStyles.styleS22W600White,
      headlineMedium: AppTextStyles.styleS20W600White,
      headlineSmall: AppTextStyles.styleS18W600White,

      titleLarge: AppTextStyles.styleS22W500White,
      titleMedium: AppTextStyles.styleS20W500White,
      titleSmall: AppTextStyles.styleS18W500White,

      bodyLarge: AppTextStyles.styleS22W400White,
      bodyMedium: AppTextStyles.styleS20W400White,
      bodySmall: AppTextStyles.styleS18W400White,

      labelLarge: AppTextStyles.styleS18W400White,
      labelMedium: AppTextStyles.styleS16W400White,
      labelSmall: AppTextStyles.styleS14W400White,
    ),
  );
}
