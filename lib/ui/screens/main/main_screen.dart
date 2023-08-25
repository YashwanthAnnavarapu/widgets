import 'package:flutter/material.dart';
import 'package:widgets/ui/screens/display/display_screen.dart';

import '../../widgets/avatar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static Future open(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> widgets = [
    {
      'title': 'Avatar',
      'widget': const Avatar(
        radius: 50,
        size: 100,
      ),
    }
  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade50),
            ),
            child: InkWell(
              onTap: () {
                DisplayScreen.open(context, widget: widgets[index]['widget']);
              },
              child: Row(
                children: [
                  Text('${index + 1}. ', style: textTheme.titleLarge),
                  Text(widgets[index]['title'], style: textTheme.titleLarge),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
