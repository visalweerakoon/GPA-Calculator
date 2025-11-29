import 'package:flutter/material.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const GPATrackerApp());
}

class GPATrackerApp extends StatelessWidget {
  const GPATrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPA Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  MainPage(),
    );
  }
}
