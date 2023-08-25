import 'package:flutter/material.dart';
import 'package:widgets/resources/theme.dart';
import 'package:widgets/ui/screens/splash/splash_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      title: 'Widgets',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior().copyWith(
        overscroll: false,
      ),
      home: const SplashScreen(),
    );
  }
}
