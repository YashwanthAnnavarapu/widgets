import 'package:flutter/material.dart';

class DisplayScreen2 extends StatefulWidget {
  final Widget child;

  const DisplayScreen2({super.key, required this.child});

  static Future open(BuildContext context, {required Widget widget}) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DisplayScreen2(child: widget)),
    );
  }

  @override
  DisplayScreen2State createState() => DisplayScreen2State();
}

class DisplayScreen2State extends State<DisplayScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display In Column Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            widget.child,
          ],
        ),
      ),
    );
  }
}
