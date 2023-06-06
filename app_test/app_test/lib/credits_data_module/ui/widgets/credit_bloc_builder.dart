// Flutter imports:
import 'package:app_test/core/theme/colors/app_colors.dart';
import 'package:app_test/credits_data_module/ui/bloc/credit_data_bloc/states/credits_data_error_state.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import '../../../core/services/service_locator.dart';
import '../bloc/credit_data_bloc/credits_data_bloc.dart';
import '../bloc/credit_data_bloc/states/credits_data_loading_state.dart';
import '../bloc/credit_data_bloc/states/credits_data_state.dart';
import '../bloc/credit_data_bloc/states/credits_data_success_state.dart';
import 'calendar_page_view.dart';
import 'loading_calendar.dart';

class CreditBlocBuilder extends StatefulWidget {
  const CreditBlocBuilder({super.key, required this.index});
  final int index;

  @override
  State<CreditBlocBuilder> createState() => _CreditBlocBuilderState();
}

class _CreditBlocBuilderState extends State<CreditBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditsDataBloc, CreditsDataState>(
      bloc: sl<CreditsDataBloc>(),
      builder: (context, state) {
        if (state is CreditsDataSuccessState) {
          var s = state.credits['${widget.index}'];
          List<DateTime> dates = _getPayDay(
            holidays: s?.holidays ?? [],
            loanMonths: s?.loanMonths ?? 0,
            takeDate: s?.takeDate ?? '',
            workDays: s?.workDays ?? [],
          );
          return CalendarPageView(
            dates: dates,
            model: s!,
          );
        }
        if (state is CreditsDataLoadingState) {
          return const LoadingCalendar();
        }
        if (state is CreditsDataErrorState) {
          return Center(
            child: Text(
              state.text,
              style: const TextStyle(color: AppColors.grey),
            ),
          );
        }
        return const Center(
          child: Text('No internet'),
        );
      },
    );
  }

  _getPayDay(
      {required List<String> holidays,
      required List<String> workDays,
      required String takeDate,
      required int loanMonths}) {
    List<String> dates = [];
    List<String> datesString = takeDate.split('.');
    int yearCounter = 0;
    int monthCount = int.parse(datesString[1]);
    for (var i = 1; i < loanMonths + 1; i++) {
      monthCount = monthCount + 1;
      if (monthCount == 13) {
        monthCount = 1;
        yearCounter++;
      }

      if (monthCount.toString().length == 1) {
        dates.add(
            '10.0$monthCount.${int.parse(datesString.last) + yearCounter}');
      } else {
        dates
            .add('10.$monthCount.${int.parse(datesString.last) + yearCounter}');
      }
    }

    for (var i = 0; i < dates.length; i++) {
      if (holidays.contains(dates[i])) {
        List a = dates[i].split('.');
        dates[i] = '${int.parse(a.first) + 1}.${a[1]}.${a.last}';
        dates[i] = _checkToWeekends(date: dates[i]);
      }
      if (workDays.contains(dates[i])) {
      } else {
        dates[i] = _checkToWeekends(date: dates[i]);
      }
    }
    List<DateTime> onCalendarDate = [];
    for (var element in dates) {
      List a = element.split('.');
      onCalendarDate.add(
          DateTime.utc(int.parse(a.last), int.parse(a[1]), int.parse(a.first)));
    }
    return onCalendarDate;
  }

  _checkToWeekends({required String date}) {
    List splitDate = date.split('.');
    String elementName = DateFormat('EEEE').format(DateTime.utc(
        int.parse(splitDate.last),
        int.parse(splitDate[1]),
        int.parse(splitDate.first)));
    if (elementName == 'Saturday') {
      date =
          '${int.parse(splitDate.first) + 2}.${splitDate[1]}.${splitDate.last}';
    }
    if (elementName == 'Sunday') {
      date =
          '${int.parse(splitDate.first) + 1}.${splitDate[1]}.${splitDate.last}';
    }
    return date;
  }
}
