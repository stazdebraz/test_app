// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../core/theme/colors/app_colors.dart';

class NotActiveItem extends StatelessWidget {
  const NotActiveItem(
      {super.key, required this.description, required this.title});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      title: Text(
        title,
        maxLines: 1,
        style: const TextStyle(color: AppColors.mainColor),
      ),
      leading: const Icon(
        Icons.credit_card,
        color: AppColors.mainColor,
        size: 40,
      ),
      subtitle: Text(
        description,
        softWrap: true,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.grey, fontSize: 9),
      ),
      trailing: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.more_vert,
          color: AppColors.mainColor,
        ),
        onPressed: () {},
      ),
    );
  }
}
