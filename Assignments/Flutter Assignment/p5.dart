import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  List<Color> colorlist = [
    Colors.white,
    Colors.grey,
    Colors.amber,
    Colors.red,
    Colors.orange
  ];

  late Color _selectedColor;

  void _changeBackground() {
    var index = Random().nextInt(colorlist.length);
    if (index != -1) {
      setState(() {
        _selectedColor = colorlist[index];
      });
    }
  }

  @override
  void initState() {
    _selectedColor = colorlist[0];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: _selectedColor,
        body: Center(
          child: Container(
            child: FilledButton(
              child: Text('Change Background'),
              onPressed: () {
                _changeBackground();
              },
            ),
          ),
        ),
      ),
    );
  }
}
