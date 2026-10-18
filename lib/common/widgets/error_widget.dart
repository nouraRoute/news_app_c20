import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/extensions/context_extensions.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMEssage, required this.onRefresh});
  final String errorMEssage;
  final void Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMEssage, style: context.textTheme.bodyMedium),
        FilledButton.icon(
          onPressed: onRefresh,
          label: Text('Refresh', style: context.textTheme.bodySmall),
          icon: Icon(Icons.refresh),
        ),
      ],
    );
  }
}
