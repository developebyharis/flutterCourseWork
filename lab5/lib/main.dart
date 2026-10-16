import 'package:flutter/material.dart';

import 'screens/student_profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile Dashboard by haris 1440',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const StudentProfileScreen(),
    );
  }
}

// Expanded vs Flexible
// Both are used inside Row, Column, or Flex to control how children use the available space.
// - Expanded: Forces a child to fill the available space.
// - Flexible: Allows a child to use available space without forcing it to fill all of it.


// Padding vs SizedBox
// - Padding: Adds space around a widget's content.
// - SizedBox: Creates a fixed-size gap between widgets.