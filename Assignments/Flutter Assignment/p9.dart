import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio_select_Color',
      home: ColorSelectScreen(),
    );
  }
}

class ColorSelectScreen extends StatefulWidget{
  @override
  _colorSelectState createState() => _colorSelectState();
}

class _colorSelectState extends State<ColorSelectScreen>{

  Color _colorSelect = Colors.white;
  int _selectRadio = 0;

  void _radioValueChange(int? value) {
    setState(() {
      _selectRadio = value!;
      switch (_selectRadio) {
        case 0:
          _colorSelect = Colors.white;
          break;
        case 1:
          _colorSelect = Colors.red;
          break;
        case 2:
          _colorSelect = Colors.green;
          break;
        case 3:
          _colorSelect = Colors.blue;
          break;
        case 4:
          _colorSelect = Colors.black;
          break;
        case 5:
          _colorSelect = Colors.pink;
          break;
        case 6:
          _colorSelect = Colors.orange;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: _colorSelect,
      appBar: AppBar(
        title: Text('Select background Color'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile<int>(
                title: const Text('White'),
                value: 0,
                groupValue: _selectRadio,
                onChanged: _radioValueChange),
            RadioListTile<int>(
                title: const Text('Red'),
                value: 1,
                groupValue: _selectRadio,
                onChanged: _radioValueChange),
            RadioListTile<int>(
                title: const Text('Green'),
                value: 2,
                groupValue: _selectRadio,
                onChanged: _radioValueChange),
            RadioListTile<int>(
                title: const Text('Blue'),
                value: 3,
                groupValue: _selectRadio,
                onChanged: _radioValueChange),
            RadioListTile<int>(
                title: const Text('Black'),
                value: 4,
                groupValue: _selectRadio,
                onChanged: _radioValueChange),
            RadioListTile<int>(
                title: const Text('Pink'),
                value: 5,
                groupValue: _selectRadio,
                onChanged: _radioValueChange),
            RadioListTile<int>(
                title: const Text('Orange'),
                value: 6,
                groupValue: _selectRadio,
                onChanged: _radioValueChange),

          ],
        ),
      ),
    );
  }

}
