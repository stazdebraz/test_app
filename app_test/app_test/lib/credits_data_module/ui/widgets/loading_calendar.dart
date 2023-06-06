// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'calendar_data_item.dart';

class LoadingCalendar extends StatefulWidget {
  const LoadingCalendar({super.key});

  @override
  State<LoadingCalendar> createState() => _LoadingCalendarState();
}

class _LoadingCalendarState extends State<LoadingCalendar> {

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade800,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CalendarDatePicker2(
                    config: CalendarDatePicker2Config(),
                    value: const [],
                  ),
                  const CalendarDataItem(
                    data: Text(''),
                    title: 'Payment day',
                  ),
                  const CalendarDataItem(
                    data: Text(''),
                    title: 'Payment amount',
                  ),
                  const CalendarDataItem(data: Text(''), title: 'Percentage')
                ],
              ),
            ),
          );
     
  }
}
