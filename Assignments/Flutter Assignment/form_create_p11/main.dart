import 'package:first_pr/Assignments/form_create_p11/login_screen.dart';
import 'package:first_pr/Assignments/form_create_p11/registration_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/', // Set the initial route to the login screen
  routes: {
    '/': (context) => MyLogin(), // Login Screen
    '/register': (context) => MyRegistrationScreen(), // Registration Screen
  },
));




