import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  final Widget child;

  const DisplayScreen({super.key, required this.child});

  static Future open(BuildContext context, {required Widget widget}) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DisplayScreen(child: widget)),
    );
  }

  @override
  DisplayScreenState createState() => DisplayScreenState();
}

class DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display Screen')),
      body: Column(
        children: [
          widget.child,
        ],
      ),
    );
  }
}
