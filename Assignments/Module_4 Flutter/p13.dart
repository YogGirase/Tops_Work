import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedValue = 'Option 1';
  final List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Toolbar'),
        actions: [
          // Spinner (Dropdown Button)
          DropdownButton<String>(
            value: _selectedValue,
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            dropdownColor: Colors.white,
            items: _dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue!;
              });
            },
          ),

          SizedBox(width: 10),


          Container(
            width: 200,
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.white),
              ),
              onChanged: (value) {
                // Handle search logic here
                print("Searching: $value");
              },
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Text(
          'Toolbar with spinner and search',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
