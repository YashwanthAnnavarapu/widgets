import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final TextEditingController timeCtrl;
  final Function onTimeChange;
  final String? hintText;
  final String? labelText;
  TimeOfDay? time;

  TimePicker(
    this.time, {
    Key? key,
    required this.timeCtrl,
    required this.onTimeChange,
    this.hintText,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return TextFormField(
      readOnly: true,
      controller: timeCtrl,
      style: textTheme.bodyLarge!.copyWith(height: 44 / 20),
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        time = await showTimePicker(
          context: context,
          initialTime: time ?? TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.dial,
        );
        timeCtrl.text = time == null
            ? ''
            : '${time?.hour.toString() ?? ''}:${time?.minute.toString() ?? ''}';

        onTimeChange(time);
      },
      validator: (value) {
        if (value == null) {
          return 'This field can\'t be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText ?? '',
        labelText: labelText ?? '',
        suffixIcon: const Icon(
          Icons.access_time_rounded,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
