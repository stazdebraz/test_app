// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:app_test/credits_data_module/data/model/credit_data_model.dart';
import 'calendar_data_item.dart';
import 'calendar_widget.dart';

class CalendarPageView extends StatefulWidget {
  const CalendarPageView({super.key, required this.model, required this.dates});
  final CreditDataModel model;
  final List<DateTime?> dates;

  @override
  State<CalendarPageView> createState() => _CalendarPageViewState();
}

class _CalendarPageViewState extends State<CalendarPageView> {
  _calculatePayment() {
    return ((widget.model.amount! +
                (widget.model.amount! * widget.model.percent! / 100)) /
            widget.model.loanMonths!)
        .round();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.dates.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CalendarWidget(
                date: widget.dates[index] ?? DateTime.now(),
              ),
              CalendarDataItem(
                data: Text(
                  DateFormat('dd.MM.yyyy').format(
                    widget.dates[index] ?? DateTime.now(),
                  ),
                ),
                title: 'Payment day',
              ),
              CalendarDataItem(
                data: Text('${_calculatePayment()} USD'),
                title: 'Payment amount',
              ),
              CalendarDataItem(
                  data: Text('${widget.model.percent}%'), title: 'Percentage')
            ],
          ),
        );
      },
    );
  }
}
