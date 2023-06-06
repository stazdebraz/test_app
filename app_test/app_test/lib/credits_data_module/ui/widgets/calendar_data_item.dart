// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../core/theme/colors/app_colors.dart';

class CalendarDataItem extends StatelessWidget {
  const CalendarDataItem({super.key, required this.data, required this.title});
  final String title;
  final Widget data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
              color: AppColors.mainColor, fontWeight: FontWeight.w600),
        ),
        data
      ],
    );
  }
}
