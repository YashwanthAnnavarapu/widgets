import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../resources/colors.dart';
import '../../resources/images.dart';

class DatePicker extends StatelessWidget {
  DateTime? date;

  final TextEditingController dateCtrl;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? hintText;
  final String? labelText;
  final String pattern;
  final String? validationText;
  final Function onDateChange;

  DatePicker(
    this.date, {
    Key? key,
    required this.dateCtrl,
    required this.onDateChange,
    this.startDate,
    this.endDate,
    this.hintText = 'Pick a Date',
    this.labelText,
    this.pattern = 'dd MMMM, yyyy',
    this.validationText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return TextFormField(
      readOnly: true,
      controller: dateCtrl,
      style: textTheme.titleMedium,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        date = await showDatePicker(
          context: context,
          initialDate: date ?? startDate ?? DateTime.now(),
          firstDate: startDate ?? DateTime(1900),
          lastDate: endDate ?? DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: MyColors.greenShade1, // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: MyColors.greenShade2, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: MyColors.primaryColor, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );

        if (date == null) return;

        dateCtrl.text = DateFormat(pattern).format(date!);
        onDateChange.call(date);
      },
      validator: (validationText == null)
          ? null
          : (value) {
              if (value == null || value.trim().isEmpty && value == '') {
                return validationText;
              }
              return null;
            },
      autocorrect: true,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: textTheme.titleMedium!.copyWith(
          color: Colors.black.withOpacity(0.5),
        ),
        suffixIcon: IconButton(
          onPressed: null,
          icon: Image.asset(Images.calendar, width: 20),
        ),
      ),
    );
  }
}
