// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:app_test/credits_data_module/ui/bloc/credits_list_bloc/events/get_credits_list_event.dart';
import 'package:app_test/credits_data_module/ui/bloc/credits_list_bloc/states/credits_list_success_state.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/theme/colors/app_colors.dart';
import '../bloc/credit_data_bloc/credits_data_bloc.dart';
import '../bloc/credit_data_bloc/events/get_credit_data_event.dart';
import '../bloc/credits_list_bloc/credits_list_bloc.dart';
import '../bloc/credits_list_bloc/states/credits_list_state.dart';
import 'credits_list_item.dart';

class CreditsList extends StatefulWidget {
  const CreditsList({super.key});

  @override
  State<CreditsList> createState() => _CreditsListState();
}

class _CreditsListState extends State<CreditsList> {
  final double _listPaddingValue = 10;
  final double _separatorHeight = 10;
  int currentIndex = -1;

  _changeCurrentIndex(
      {required int index, required BuildContext context}) async {
    currentIndex = index;
    sl<CreditsDataBloc>().add(GetCreditDataEvent(index: index));
    setState(() {});
  }

  @override
  void initState() {
    sl<CreditsListBloc>().add(GetCreditsListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditsListBloc, CreditsListState>(
      bloc: sl<CreditsListBloc>(),
      builder: (context, state) {
        if (state is CreditsListSuccessState) {
          var s = state.model;
          return ListView.separated(
              padding: EdgeInsets.all(_listPaddingValue),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                    height: _separatorHeight,
                  ),
              itemCount: s.credits?.length ?? 0,
              itemBuilder: (context, index) {
                return CreditsListItem(
                  index: index,
                  isActive: currentIndex == index,
                  onTap: () {
                    _changeCurrentIndex(index: index, context: context);
                  },
                  description: s.credits?[index].description ?? '',
                  title: s.credits?[index].type ?? '',
                );
              });
        }
        return const Text(
          'No internet',
          style: TextStyle(color: AppColors.grey),
        );
      },
    );
  }
}
