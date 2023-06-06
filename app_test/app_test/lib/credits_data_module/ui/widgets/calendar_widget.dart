// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: CalendarDatePicker2WithActionButtonsConfig(
          lastMonthIcon: const SizedBox.shrink(),
          nextMonthIcon: const SizedBox.shrink(),
          firstDayOfWeek: 1,
          firstDate: date,
          lastDate: date,
          calendarViewMode: DatePickerMode.day),
      value: [
        date,
      ],
    );
  }
}
