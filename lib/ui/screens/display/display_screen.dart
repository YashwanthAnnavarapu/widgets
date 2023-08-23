import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  final Widget widget;

  const DisplayScreen({super.key, required this.widget});

  @override
  DisplayScreenState createState() => DisplayScreenState();
}

class DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display Screen')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          widget,
        ],
      ),
    );
  }
}
