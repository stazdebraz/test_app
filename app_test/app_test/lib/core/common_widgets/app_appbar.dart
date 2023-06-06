// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_test/core/theme/colors/app_colors.dart';
import 'package:app_test/core/theme/text_styles/app_text_styles.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({super.key, required this.title});
  final String title;
  final double _appbarHeight = 60;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu,color: AppColors.white,),
          onPressed: () {},
        ),
        title: Text(
          title,
          style: AppTextStyles.appbar,
        ),
        backgroundColor: AppColors.mainColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_appbarHeight);
}
