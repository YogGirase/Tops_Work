import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Message'),
        backgroundColor: Colors.grey.shade100,
      ),
      body: Center(
        child: FilledButton(
            onPressed: () {
              _showAlertDialoge(context);
            },
            child: Text(
              'Show Alert Dialoge',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            )),
      ),
    );
  }
}


void _showAlertDialoge(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.warning,
              color: Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Alert!'),
          ],
        ),
        content: Text(
            'This is a simple alert dialog.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Okay'),
          )
        ],
      );
    },
  );
}
