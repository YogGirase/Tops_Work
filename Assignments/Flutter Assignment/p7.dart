import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckBox Text View App',
      home: CheckBoxView(),
    );
  }
}

class CheckBoxView extends StatefulWidget{
  @override
  _checkBoxViewState createState() => _checkBoxViewState();
}

class _checkBoxViewState extends State<CheckBoxView> {
  bool isChecked = false;

  void _checkView(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Check Box View'),
          backgroundColor: Colors.blue.shade100,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(value: isChecked, onChanged: _checkView),
              if(isChecked)
                Text('Text is Checked', style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
      );
  }
}



















