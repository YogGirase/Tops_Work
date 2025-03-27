import 'package:chatter_app/Chatter/Screens/demo.dart';
import 'package:chatter_app/Screens/HomeScreen.dart';
import 'package:chatter_app/Screens/SIGNUP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MySignInScreen extends StatefulWidget {
  const MySignInScreen({super.key});

  @override
  State<MySignInScreen> createState() => _MySignInScreenState();
}

class _MySignInScreenState extends State<MySignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> login(String? email, String? password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);

    User? user = userCredential.user;

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomeScreen(
            user: user,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          "SIGNIN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login here!',
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
                controller: _emailController,
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
                controller: _passwordController,
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
                    login(_emailController.text.toString(),
                        _passwordController.text.toString());
                  },
                  child: Text(
                    "Login",
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
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MySignupScreen(),
                          ));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
