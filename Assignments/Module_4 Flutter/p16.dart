import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Selection Dialog',
      home: CitySelectionPage(),
    );
  }
}

class CitySelectionPage extends StatefulWidget {
  @override
  _CitySelectionPageState createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  List<String> _cities = ["New York", "London", "Tokyo", "Delhi", "Sydney"];
  String? _selectedCity; // To store the selected city

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Selection Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedCity == null
                  ? "No city selected"
                  : "Selected City: $_selectedCity",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showCitySelectionDialog(context);
              },
              child: Text('Choose a City'),
            ),
          ],
        ),
      ),
    );
  }

  // Show the alert dialog with city selection
  void _showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            String? tempSelectedCity = _selectedCity; // Temporary storage for selected city

            return AlertDialog(
              title: Text("Select a City"),
              content: SingleChildScrollView(
                child: Column(
                  children: _cities.map((city) {
                    return RadioMenuButton(
                      value: _cities.toList(),
                      groupValue: tempSelectedCity,
                      onChanged: (value) {
                          setState((){
                              tempSelectedCity=value as String?;
                          });
                      }, child: null,);
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Close dialog without changing
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedCity = tempSelectedCity; // Set the selected city
                    });
                    Navigator.of(context)
                        .pop(); // Close dialog with the selection
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
    ).then((_) {
      // Print the selected city on the home page after the dialog is closed
      if (_selectedCity != null) {
        setState(() {
          print("Selected City: $_selectedCity"); // Print the city to console
        });
      }
    });
  }
}
