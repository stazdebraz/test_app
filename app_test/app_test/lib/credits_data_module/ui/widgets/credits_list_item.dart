
// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_test/core/theme/colors/app_colors.dart';
import 'package:app_test/credits_data_module/ui/widgets/credit_bloc_builder.dart';
import 'not_active_item.dart';

// Package imports:


class CreditsListItem extends StatefulWidget {
  const CreditsListItem(
      {super.key,
      required this.isActive,
      required this.index,
      required this.onTap,
      required this.title,
      required this.description});
  final bool isActive;
  final int index;
  final Function() onTap;
  final String title;
  final String description;

  @override
  State<CreditsListItem> createState() => _CreditsListItemState();
}

class _CreditsListItemState extends State<CreditsListItem> {
  final double _itemActiveSize = 500;
  final double _itemNotActiveSize = 100;
  final double _itemPaddingValue = 10;
  final double _itemBorderRadiusValue = 10;
  final int _itemAnimationDuration = 0;
  bool isContainerOpened = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        curve: Curves.easeOut,
        height: widget.isActive ? _itemActiveSize : _itemNotActiveSize,
        transformAlignment: Alignment.center,
        padding: EdgeInsets.all(_itemPaddingValue),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(_itemBorderRadiusValue),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              color: AppColors.grey.withOpacity(0.3),
            ),
          ],
        ),
        duration: Duration(milliseconds: _itemAnimationDuration),
        child: widget.isActive
            ? CreditBlocBuilder(index: widget.index)
            : NotActiveItem(
                title: widget.title,
                description: widget.description,
              ),
      ),
    );
  }
}
