import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: HomeScreen(),
    );
  }
}

void main() {
  runApp(const App());
}
