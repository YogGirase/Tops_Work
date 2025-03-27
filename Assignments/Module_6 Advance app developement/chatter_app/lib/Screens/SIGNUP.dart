import 'package:chatter_app/Screens/SIGNIN_Screen.dart' show MySignInScreen;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MySignupScreen extends StatefulWidget {
  const MySignupScreen({super.key});

  @override
  State<MySignupScreen> createState() => _MySignupScreenState();
}

class _MySignupScreenState extends State<MySignupScreen> {
  TextEditingController _nameField = TextEditingController();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  String profilePic =
      "https://cdn3d.iconscout.com/3d/premium/thumb/profile-8260859-6581822.png?f=webp";

  Future<void> registerUser(
      String? username, String? email, String? password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);

    User? user = userCredential.user;

    await FirebaseFirestore.instance.collection("Person").doc(user!.uid).set({
      "username": username,
      "email": email,
      "profilePic": profilePic,
    });
    _nameField.clear();
    _emailField.clear();
    _passwordField.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          "SIGNUP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Register here!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blue),
            ),
            SizedBox(
              width: 150,
              child: Divider(color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _nameField,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Name",
                labelText: "Name",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailField,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Email",
                labelText: "Email",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordField,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Password",
                labelText: "Password",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: 140,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () {
                  registerUser(
                      _nameField.text.toString(),
                      _emailField.text.toString(),
                      _passwordField.text.toString());
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: TextStyle(color: Colors.grey.shade600)),
                SizedBox(width: 2),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MySignInScreen(),
                          ));
                    },
                    child: Text('Login', style: TextStyle(color: Colors.blue))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
