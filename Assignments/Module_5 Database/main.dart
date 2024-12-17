import 'package:flutter/material.dart';
import 'package:flutter_practical/sqlite/screens/student_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlite Database',
      home: StudentScreen(),
    );
  }
}
