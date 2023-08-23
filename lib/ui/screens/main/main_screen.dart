import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> widgets = [
    {'title': 'Title 1', 'widget': 'Widget 1'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: Text('$index. '),
            title: Text(widgets[index]['title']),
          );
        },
      ),
    );
  }
}
