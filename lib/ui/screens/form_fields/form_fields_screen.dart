import 'package:flutter/material.dart';
import 'package:widgets/ui/widgets/date_picker.dart';
import 'package:widgets/ui/widgets/time_picker.dart';

class FormFieldsScreen extends StatefulWidget {
  const FormFieldsScreen({super.key});

  static Future open(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const FormFieldsScreen()),
    );
  }

  @override
  FormFieldsScreenState createState() => FormFieldsScreenState();
}

class FormFieldsScreenState extends State<FormFieldsScreen> {
  final dateCtrl = TextEditingController();
  final timeCtrl = TextEditingController();

  TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Field Widgets')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DatePicker(
                DateTime.now(),
                dateCtrl: dateCtrl,
                startDate: DateTime(2000),
                endDate: DateTime(2025),
                onDateChange: (value) {
                  print(value);
                },
              ),
              const SizedBox(height: 16),
              TimePicker(
                time,
                timeCtrl: timeCtrl,
                onTimeChange: (time) {
                  this.time = time;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
