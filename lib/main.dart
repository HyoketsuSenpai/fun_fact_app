import 'package:flutter/material.dart';
import 'package:fun_fact_app_flutter/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(color: Colors.deepPurpleAccent),
      ),
      
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(color: Colors.deepPurple),
      ),

      themeMode: ThemeMode.system,

      home: const HomeScreen(),
    );
  }
}

