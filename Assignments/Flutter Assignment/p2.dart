import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reverse Number App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReverseNumberPage(),
    );
  }
}

class ReverseNumberPage extends StatefulWidget {
  @override
  _ReverseNumberPageState createState() => _ReverseNumberPageState();
}

class _ReverseNumberPageState extends State<ReverseNumberPage> {
  final TextEditingController _controller = TextEditingController();
  String _reversedNumber = "";

  void _reverseNumber() {
    String inputNumber = _controller.text;
    String reversed = inputNumber.split('').reversed.join('');
    setState(() {
      _reversedNumber = reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverse Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reverseNumber,
              child: Text('Reverse Number'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Reversed Number',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              controller: TextEditingController(text: _reversedNumber),
            ),
          ],
        ),
      ),
    );
  }
}