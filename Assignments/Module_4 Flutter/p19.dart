import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OptionsMenuExample(),
    );
  }
}

class OptionsMenuExample extends StatelessWidget {
  void _handleMenuSelection(BuildContext context, String value) {
    if (value == 'profile') {
      _navigateToProfile(context);
    } else if (value == 'logout') {
      _logout(context);
    }
  }

  void _navigateToProfile(BuildContext context) {
    // Replace with actual navigation logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Navigating to Profile')),
    );
  }

  void _logout(BuildContext context) {
    // Replace with actual logout logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logging out...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options Menu Example'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _handleMenuSelection(context, value),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'profile',
                child: Text('Profile'),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('Press the options menu in the AppBar'),
      ),
    );
  }
}
