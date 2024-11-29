import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeeMy(),
    );
  }
}
class HomeeMy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlertDialog(context);
          },
          child: Text(
            'Show Alert Dialog',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Choose an Option'),
        content: Text('Select one of the following options.'),
        actions: [
          // Positive button
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showToast('You chose: Positive');
            },
            child: Text('Positive'),
          ),
          // Neutral button
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showToast('You chose: Neutral');
            },
            child: Text('Neutral'),
          ),
          // Negative button
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showToast('You chose: Negative');
            },
            child: Text('Negative'),
          ),
        ],
      );
    },
  );
}

void _showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.green.shade200,
    gravity: ToastGravity.CENTER_LEFT,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}
