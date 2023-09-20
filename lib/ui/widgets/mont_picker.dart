import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../utils/helper.dart';

class MonthPicker extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime initialDate;
  final Function onTap;

  const MonthPicker({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.initialDate,
    required this.onTap,
  });

  @override
  MonthPickerState createState() => MonthPickerState();
}

class MonthPickerState extends State<MonthPicker> {
  DateTime selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? month = await showMonthPicker(
          context: context,
          initialDate: widget.initialDate,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          headerColor: Colors.blueAccent,
          headerTextColor: Colors.white,
          selectedMonthBackgroundColor: Colors.blueAccent,
          unselectedMonthTextColor: Colors.black,
        );

        if (month == null) return;

        selectedMonth = month;
        widget.onTap(month);
      },
      child: Container(
        width: 100,
        height: 35,
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(Helper.formatDate(date: selectedMonth, pattern: 'MMM')),
            const Icon(Icons.arrow_drop_down_rounded, size: 24),
          ],
        ),
      ),
    );
  }
}
