import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Size Adjuster',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FontSizeAdjuster(),
    );
  }
}

class FontSizeAdjuster extends StatefulWidget {
  @override
  _FontSizeAdjusterState createState() => _FontSizeAdjusterState();
}

class _FontSizeAdjusterState extends State<FontSizeAdjuster> {
  double _fontSize = 20.0; // Initial font size

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0; // Increase the font size
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 10.0) {
        // Limit the minimum font size
        _fontSize -= 2.0; // Decrease the font size
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('FontSizeAdjuster'),
        backgroundColor: Colors.amber.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Increase or Decrease Font Size',
              style: TextStyle(fontSize: _fontSize,fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: _decreaseFontSize,
                  icon: Icon(Icons.remove),
                  tooltip: 'Decrease Font Size',
                ),
                IconButton(
                  onPressed: _increaseFontSize,
                  icon: Icon(Icons.add),
                  tooltip: 'Increase Font Size',
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
